/* -*- Mode:C++; c-file-style:"gnu"; indent-tabs-mode:nil; -*- */
/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation;
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "ns3/core-module.h"
#include "ns3/point-to-point-module.h"
#include "ns3/network-module.h"
#include "ns3/applications-module.h"
#include "ns3/wifi-module.h"
#include "ns3/mobility-module.h"
#include "ns3/csma-module.h"
#include "ns3/internet-module.h"
#include "ns3/propagation-loss-model.h"
#include "ns3/aodv-module.h"
using namespace ns3;

uint32_t bytesTotal;
uint32_t packetsReceived;

NS_LOG_COMPONENT_DEFINE ("MobilityModel");

//This function keeps track of the position of a moving node (x,y) coordinates
void CourseChangeSink (Ptr<OutputStreamWrapper> stream, std::string context, Ptr<const MobilityModel> model)
{
        Vector position = model->GetPosition ();
        NS_LOG_UNCOND (Simulator::Now ().GetSeconds () <<
        " x = " << position.x << ", y = " << position.y);
        *stream->GetStream () << Simulator::Now ().GetSeconds () << "\t" << position.x << "\t" << position.y << std::endl;
}

static inline std::string PrintReceivedPacket (Ptr<Socket> socket, Ptr<Packet> packet)
{
        SocketAddressTag tag;
        bool found;
        found = packet->PeekPacketTag (tag);
        std::ostringstream oss;

        oss << Simulator::Now ().GetSeconds () << " " ;

        if (found)
        {
                InetSocketAddress addr = InetSocketAddress::ConvertFrom (tag.GetAddress ());
                oss << " received one packet from " << addr.GetIpv4 ();
        }
        else
        {
                oss << " received one packet! ";
        }
        return oss.str ();
}

static void GenerateTraffic (Ptr<Socket> socket, uint32_t pktSize, uint32_t pktCount, Time pktInterval )
{
        //This function generates traffic
        //pktCount: no. of packets to be generated
        //pktSize: size of each packet (bytes)
        //pktInterval: time interval between packets

        if (pktCount > 0)
        {
                socket->Send (Create<Packet> (pktSize));
                Simulator::Schedule (pktInterval, &GenerateTraffic, socket, pktSize, pktCount-1, pktInterval);
        }
        else
        {
                socket->Close ();
        }
}

//This function keeps track of received packets by a socket
void ReceivePacket (Ptr<OutputStreamWrapper> stream, Ptr<Socket> socket)
{
        Ptr<Packet> packet;
        while ((packet = socket->Recv ()))
        {
                bytesTotal += packet->GetSize ();
                packetsReceived += 1;
                NS_LOG_UNCOND (PrintReceivedPacket (socket, packet));
                *stream->GetStream () << Simulator::Now ().GetSeconds () << "\t" << "Node 2 Packet Received" << std::endl;
        }
}

void PHYLevelPacketNode1 (Ptr<OutputStreamWrapper> stream, Ptr<const Packet> p)
{
        NS_LOG_UNCOND(Simulator::Now ().GetSeconds () << " 1 received one packet PHY LEVEL");
        *stream->GetStream () << Simulator::Now ().GetSeconds () << "\t" << "Node 1 Packet Received PHY LEVEL" << std::endl;
}

//This is the main function
int main (int argc, char *argv[])
{
        double duration = 10.0;
        double txp = 1.5; //transmission power dB
        std::string phyMode ("DsssRate1Mbps");

        //Set Non-unicastMode rate to unicast mode
        Config::SetDefault ("ns3::WifiRemoteStationManager::NonUnicastMode",StringValue (phyMode));

        // 1. Create the nodes
        NodeContainer adhocNodes;
        adhocNodes.Create(3);  //All 3 nodes are members of adhocNodes
        NodeContainer mobileNode = NodeContainer (adhocNodes.Get(1)); //Node 1 is defined as the mobileNode
        NodeContainer stationaryNodes = NodeContainer (adhocNodes.Get(0), adhocNodes.Get(2)); //Node 0 and Node 2 are defined as stationaryNodes

        // 2. Set up physical layer
        WifiHelper wifi;
        wifi.SetStandard (WIFI_PHY_STANDARD_80211b); //Use 802.11 standard
        YansWifiPhyHelper wifiPhy =  YansWifiPhyHelper::Default ();
        wifiPhy.Set ("RxGain", DoubleValue (-10) ); //Set up the gain at the receiver (in dB)

        // 3. Set up propagation loss model
        YansWifiChannelHelper wifiChannel;


        std::string lossModel = "ns3::RangePropagationLossModel";//Range propagation loss model
        std::string atr1 = "MaxRange";
        wifiChannel.AddPropagationLoss (lossModel, atr1, DoubleValue(200)); // maximum transmission range = 200 m

        wifiChannel.SetPropagationDelay ("ns3::ConstantSpeedPropagationDelayModel"); //set up the propagation delay model
        wifiPhy.SetChannel (wifiChannel.Create ());

        wifiPhy.Set ("TxPowerStart",DoubleValue (txp)); //Set up the transmission power
        wifiPhy.Set ("TxPowerEnd", DoubleValue (txp));


        // 4. Set up MAC layer and install wireless devices
        NqosWifiMacHelper wifiMac = NqosWifiMacHelper::Default ();
        wifi.SetRemoteStationManager ("ns3::ConstantRateWifiManager",
                                      "DataMode",StringValue ("DsssRate2Mbps"),
                                      "ControlMode",StringValue ("DsssRate1Mbps"));
        wifiMac.SetType ("ns3::AdhocWifiMac"); //Set MAC to ad hoc mode
        NetDeviceContainer devices = wifi.Install (wifiPhy, wifiMac, adhocNodes);

        // 5. Set up mobility model for Node 1
        MobilityHelper mobilityMobileNode;

        Ptr<ListPositionAllocator> positionAllocMobileNode = CreateObject<ListPositionAllocator> ();
        positionAllocMobileNode->Add (Vector (150.0, 0.0, 0.0)); //3D coordinates (x,y,z). Use only the x-y plane
        mobilityMobileNode.SetPositionAllocator (positionAllocMobileNode);

        mobilityMobileNode.SetMobilityModel ("ns3::RandomWalk2dMobilityModel",
                                             "Mode", StringValue ("Time"),
                                             "Time", StringValue ("1s"),
                                             "Speed", StringValue ("ns3::ConstantRandomVariable[Constant=20.0]"), //This is where we set the speed of node 1 (m/s)
                                             "Bounds", RectangleValue (Rectangle (0, 300, -150, 150))); //This is the size of the simulated area.
                                             //A 300 x 300 2D rectangle  for Node 1 to walk on. From 0 to 300 in the x-axis and from -150 to 150 in the y axis

        mobilityMobileNode.Install (mobileNode);

        // 6. Connect trace source to trace sink for Node 1
        std::ostringstream oss;
        oss <<
        "/NodeList/" << mobileNode.Get (0)->GetId () <<
        "/$ns3::MobilityModel/CourseChange";

        AsciiTraceHelper asciiTraceHelper;
        Ptr<OutputStreamWrapper> locationStream = asciiTraceHelper.CreateFileStream ("Lab4II_Location.txt");

        Config::Connect (oss.str (), MakeBoundCallback (&CourseChangeSink, locationStream));

        // 7. Assign positions to Node 0 and Node 2
        MobilityHelper mobilityStaNodes;
        mobilityStaNodes.SetMobilityModel ("ns3::ConstantPositionMobilityModel");
        Ptr<ListPositionAllocator> positionAllocStaNodes = CreateObject<ListPositionAllocator> ();
        positionAllocStaNodes->Add (Vector (0.0, 0.0, 0.0)); //3D coordinates (x,y,z). Use only the x-y plane
        positionAllocStaNodes->Add (Vector (300.0, 0.0, 0.0)); //3D coordinates (x,y,z). Use only the x-y plane
        mobilityStaNodes.SetPositionAllocator(positionAllocStaNodes);
        mobilityStaNodes.Install (stationaryNodes);

        // 8. Set up  the routing protocol (AODV)
        AodvHelper aodv;
        Ipv4ListRoutingHelper list;
        InternetStackHelper internet;
        aodv.Set("EnableHello", BooleanValue(false));
        aodv.Set("GratuitousReply", BooleanValue(false));
        aodv.Set("ActiveRouteTimeout", ns3::TimeValue(Seconds(600)));
        list.Add (aodv, 100);

        internet.SetRoutingHelper (list);
        internet.Install (adhocNodes);

        // 9. Assign IP addresses to nodes
        Ipv4AddressHelper address;
        address.SetBase ("10.1.1.0", "255.255.255.0");
        Ipv4InterfaceContainer interfaces;
        interfaces = address.Assign (devices);

        // 10. Create sink and source sockets
        TypeId tid = TypeId::LookupByName ("ns3::UdpSocketFactory");
        Ptr<Socket> recvSink = Socket::CreateSocket (adhocNodes.Get (2), tid);
        InetSocketAddress local = InetSocketAddress (Ipv4Address::GetAny (), 9);
        recvSink->Bind (local);

        Ptr<OutputStreamWrapper> rcvdStream = asciiTraceHelper.CreateFileStream ("Lab4II_Rcvd.txt");
        recvSink->SetRecvCallback (MakeBoundCallback (&ReceivePacket, rcvdStream));
        Config::ConnectWithoutContext("/NodeList/1/DeviceList/*/$ns3::WifiNetDevice/Phy/PhyRxEnd", MakeBoundCallback(&PHYLevelPacketNode1, rcvdStream));

        Ptr<Socket> source = Socket::CreateSocket (adhocNodes.Get (0), tid);
        InetSocketAddress remote = InetSocketAddress (interfaces.GetAddress (2, 0), 9);
        source->Connect (remote);

        // 11. Generate traffic
        uint32_t numPackets = 1000;
        double interval = 1.0; //seconds
        uint32_t packetSize = 200; //bytes
        Time interPacketInterval = Seconds (interval);

        Simulator::Schedule (Seconds (1.0), &GenerateTraffic, source, packetSize, numPackets, interPacketInterval);

        wifiPhy.EnableAsciiAll(asciiTraceHelper.CreateFileStream ("Lab4II_PacketsContent.txt"));

        // 12. Run the simulation
        Simulator::Stop (Seconds (duration));
        Simulator::Run ();
        Simulator::Destroy ();

        return 0;
}

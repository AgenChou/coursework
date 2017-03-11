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

/*
    LAB #4  AODV Operation

    Solution by: Wilson M. Tan (wilson.tan@warwick.ac.uk) based on NS-3 example code
*/

#include <fstream>
#include <iostream>
#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/internet-module.h"
#include "ns3/mobility-module.h"
#include "ns3/wifi-module.h"
#include "ns3/aodv-module.h"
#include "ns3/applications-module.h"
#include "ns3/propagation-module.h"
using namespace ns3;

#define VERBOSE 0

NS_LOG_COMPONENT_DEFINE ("aodv-demo");

static inline std::string PrintReceivedPacket (Ptr<Socket> socket, Ptr<Packet> packet)
{
        SocketAddressTag tag;
        bool found;
        found = packet->PeekPacketTag (tag);
        std::ostringstream oss;

        oss << Simulator::Now ().GetSeconds () << " " << socket->GetNode ()->GetId ();

        if (found)
        {
                InetSocketAddress addr = InetSocketAddress::ConvertFrom (tag.GetAddress ());
                oss << " received one packet from " << addr.GetIpv4 ();
        }
        else
        {
                oss << " received one packet!";
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
                Simulator::Schedule (pktInterval, &GenerateTraffic, socket, pktSize,pktCount-1, pktInterval);
        }
        else
        {
                socket->Close ();
        }
}

//This function simualates a link breakage between nodes 3 and 4
static void RouteBreak (Ptr<MatrixPropagationLossModel> model, NodeContainer nodes)
{
        model->SetLoss (nodes.Get (3)->GetObject<MobilityModel>(), nodes.Get (4)->GetObject<MobilityModel>(), 400); // break the link between 3 and 4
}

//This function keeps track of received packets by a socket
void ReceivePacket (Ptr<Socket> socket)
{
        Ptr<Packet> packet;
        while ((packet = socket->Recv ()))
        {
                NS_LOG_UNCOND (PrintReceivedPacket (socket, packet));
        }
}

void PHYLevelPacketNode0 (Ptr<const Packet> p)
{
        NS_LOG_UNCOND(Simulator::Now ().GetSeconds () << " 0 received one packet PHY LEVEL");
        if (VERBOSE)
        {
                p->Print(std::cout);
                std::cout << " \n ---------- \n";
        }
}

void PHYLevelPacketNode1 (Ptr<const Packet> p)
{
        NS_LOG_UNCOND(Simulator::Now ().GetSeconds () << " 1 received one packet PHY LEVEL");
        if (VERBOSE)
        {
                p->Print(std::cout);
                std::cout << " \n ---------- \n";
        }
}

void PHYLevelPacketNode2 (Ptr<const Packet> p)
{
        NS_LOG_UNCOND(Simulator::Now ().GetSeconds () << " 2 received one packet PHY LEVEL");
        if (VERBOSE)
        {
                p->Print(std::cout);
                std::cout << " \n ---------- \n";
        }
}

void PHYLevelPacketNode3 (Ptr<const Packet> p)
{
        NS_LOG_UNCOND(Simulator::Now ().GetSeconds () << " 3 received one packet PHY LEVEL");
        if (VERBOSE)
        {
                p->Print(std::cout);
                std::cout << " \n ---------- \n";
        }
}

void PHYLevelPacketNode4 (Ptr<const Packet> p)
{
        NS_LOG_UNCOND(Simulator::Now ().GetSeconds () << " 4 received one packet PHY LEVEL");
        if (VERBOSE)
        {
                p->Print(std::cout);
                std::cout << " \n ---------- \n";
        }
}

void PHYLevelPacketNode5 (Ptr<const Packet> p)
{
        NS_LOG_UNCOND(Simulator::Now ().GetSeconds () << " 5 received one packet PHY LEVEL");
        if (VERBOSE)
        {
                p->Print(std::cout);
                std::cout << " \n ---------- \n";
        }
}

void PHYLevelPacketNode6 (Ptr<const Packet> p)
{
        NS_LOG_UNCOND(Simulator::Now ().GetSeconds () << " 6 received one packet PHY LEVEL");
        if (VERBOSE)
        {
                p->Print(std::cout);
                std::cout << " \n ---------- \n";
        }
}

//This is the main function
int main (int argc, char *argv[])
{
        int nWifis = 7; //seven ad hoc nodes

        std::string rate ("2048bps");
        std::string phyMode ("DsssRate11Mbps"); //We employ DSSS
        std::string tr_name ("manet-routing-compare");

        Packet::EnablePrinting ();
        Packet::EnableChecking ();

        //Set non-unicastMode rate to unicast mode
        Config::SetDefault ("ns3::WifiRemoteStationManager::NonUnicastMode",StringValue (phyMode));

        // 1. Create the nodes
        NodeContainer adhocNodes;
        adhocNodes.Create (nWifis);
        for (size_t i = 0; i < 7; ++i)
        {
                adhocNodes.Get (i)->AggregateObject (CreateObject<ConstantPositionMobilityModel> ());
        }

        // 2. Set up a propagation loss matrix
        Ptr<MatrixPropagationLossModel> lossModel = CreateObject<MatrixPropagationLossModel> ();
        lossModel->SetDefaultLoss (400); // set default loss to 400 dB (no link)
        lossModel->SetLoss (adhocNodes.Get (0)->GetObject<MobilityModel>(), adhocNodes.Get (1)->GetObject<MobilityModel>(), 10); // set symmetric loss 0 <-> 1 to 10 dB
        lossModel->SetLoss (adhocNodes.Get (2)->GetObject<MobilityModel>(), adhocNodes.Get (1)->GetObject<MobilityModel>(), 10); // set symmetric loss 2 <-> 1 to 10 dB
        lossModel->SetLoss (adhocNodes.Get (3)->GetObject<MobilityModel>(), adhocNodes.Get (1)->GetObject<MobilityModel>(), 10); // set symmetric loss 3 <-> 1 to 10 dB
        lossModel->SetLoss (adhocNodes.Get (4)->GetObject<MobilityModel>(), adhocNodes.Get (3)->GetObject<MobilityModel>(), 10); // set symmetric loss 4 <-> 3 to 10 dB
        lossModel->SetLoss (adhocNodes.Get (2)->GetObject<MobilityModel>(), adhocNodes.Get (5)->GetObject<MobilityModel>(), 10); // set symmetric loss 2 <-> 5 to 10 dB
        lossModel->SetLoss (adhocNodes.Get (5)->GetObject<MobilityModel>(), adhocNodes.Get (6)->GetObject<MobilityModel>(), 10); // set symmetric loss 5 <-> 6 to 10 dB
        lossModel->SetLoss (adhocNodes.Get (6)->GetObject<MobilityModel>(), adhocNodes.Get (4)->GetObject<MobilityModel>(), 10); // set symmetric loss 6 <-> 4 to 10 dB

        // 3. Set up the WiFi channel
        Ptr<YansWifiChannel> wifiChannel = CreateObject <YansWifiChannel> ();
        wifiChannel->SetPropagationLossModel (lossModel);
        wifiChannel->SetPropagationDelayModel (CreateObject <ConstantSpeedPropagationDelayModel> ());

        // 4. Set up the physical and MAC layer, install wireless devices
        WifiHelper wifi;
        wifi.SetStandard (WIFI_PHY_STANDARD_80211b);
        wifi.SetRemoteStationManager ("ns3::ConstantRateWifiManager",
                                      "DataMode",StringValue (phyMode),
                                      "ControlMode",StringValue (phyMode));
        YansWifiPhyHelper wifiPhy =  YansWifiPhyHelper::Default ();
        wifiPhy.SetChannel (wifiChannel);
        NqosWifiMacHelper wifiMac = NqosWifiMacHelper::Default ();
        wifiMac.SetType ("ns3::AdhocWifiMac"); // use ad hoc MAC
        NetDeviceContainer adhocDevices = wifi.Install (wifiPhy, wifiMac, adhocNodes);

        // 5. Set up the routing protocol (AODV)
        AodvHelper aodv;
        Ipv4ListRoutingHelper list;
        InternetStackHelper internet;

        aodv.Set("EnableHello", BooleanValue(false));
        aodv.Set("GratuitousReply", BooleanValue(false));
        aodv.Set("ActiveRouteTimeout", ns3::TimeValue(Seconds(30.0))); //Here, we specify how long the pointers associated with a discovered route last

        list.Add (aodv, 100);

        internet.SetRoutingHelper (list);
        internet.Install (adhocNodes);

        // 6. Assign IP addresses to the nodes.
        NS_LOG_INFO ("assigning ip address");
        Ipv4AddressHelper addressAdhoc;
        addressAdhoc.SetBase ("10.1.1.0", "255.255.255.0");
        Ipv4InterfaceContainer adhocInterfaces;
        adhocInterfaces = addressAdhoc.Assign (adhocDevices);

        // 7. Create sink and source sockets
        TypeId tid = TypeId::LookupByName ("ns3::UdpSocketFactory");
        Ptr<Socket> recvSink = Socket::CreateSocket (adhocNodes.Get (4), tid);
        InetSocketAddress local = InetSocketAddress (Ipv4Address::GetAny (), 9);
        recvSink->Bind (local);
        recvSink->SetRecvCallback (MakeCallback (&ReceivePacket));

        Config::ConnectWithoutContext("/NodeList/0/DeviceList/*/$ns3::WifiNetDevice/Phy/PhyRxEnd", MakeCallback(&PHYLevelPacketNode0));
        Config::ConnectWithoutContext("/NodeList/1/DeviceList/*/$ns3::WifiNetDevice/Phy/PhyRxEnd", MakeCallback(&PHYLevelPacketNode1));
        Config::ConnectWithoutContext("/NodeList/2/DeviceList/*/$ns3::WifiNetDevice/Phy/PhyRxEnd", MakeCallback(&PHYLevelPacketNode2));
        Config::ConnectWithoutContext("/NodeList/3/DeviceList/*/$ns3::WifiNetDevice/Phy/PhyRxEnd", MakeCallback(&PHYLevelPacketNode3));
        Config::ConnectWithoutContext("/NodeList/4/DeviceList/*/$ns3::WifiNetDevice/Phy/PhyRxEnd", MakeCallback(&PHYLevelPacketNode4));
        Config::ConnectWithoutContext("/NodeList/5/DeviceList/*/$ns3::WifiNetDevice/Phy/PhyRxEnd", MakeCallback(&PHYLevelPacketNode5));
        Config::ConnectWithoutContext("/NodeList/6/DeviceList/*/$ns3::WifiNetDevice/Phy/PhyRxEnd", MakeCallback(&PHYLevelPacketNode6));

        Ptr<Socket> source = Socket::CreateSocket (adhocNodes.Get (0), tid);
        InetSocketAddress remote = InetSocketAddress (adhocInterfaces.GetAddress (4, 0), 9);
        source->Connect (remote);

        // 8. Generate traffic
        uint32_t numPackets = 2;
        double interval = 20.0; // seconds
        uint32_t packetSize = 100; // bytes
        Time interPacketInterval = Seconds (interval);

        Simulator::Schedule (Seconds (1.0), &GenerateTraffic, source, packetSize, numPackets, interPacketInterval);

        Simulator::Schedule (Seconds (15.0), &RouteBreak, lossModel, adhocNodes); //Here, we schedule a link breakage 40 secons into the simulation

        // 9. Create ASCII tracing, run the simulation
        AsciiTraceHelper ascii;
        wifiPhy.EnableAsciiAll(ascii.CreateFileStream ("Lab4I_PacketsContent.txt"));

        NS_LOG_INFO ("Run Simulation.");

        Simulator::Stop (Seconds (45.0));
        Simulator::Run ();

        Simulator::Destroy ();

        return 0;
}



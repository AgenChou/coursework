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
    LAB #2  TRANSMISSION RANGE AND TRANSMISSION POWER IN AD HOC NETWORKS

    1. Creates a wireless ad-hoc network with two nodes Node0, Node1.

    2. Places the nodes on a plane separated by a distance d=distance

    3. Creates a custom traffic source and destination with a single packet of size s=packetSize

    4. Runs the simulation for different distance and transmission power values

    5. Output the results on the screen and in a comma delimited file


    Solution by: Victor Sanchez (vsanchez@dcs.warwick.ac.uk) based on NS-3 tutorials
*/


// Network topology
//
//
//        n0 ------ n1
//
//
// - All nodes employ the IEEE 802.11b standard

#include <fstream>
#include <iostream>
#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/internet-module.h"
#include "ns3/mobility-module.h"
#include "ns3/wifi-module.h"
#include "ns3/propagation-loss-model.h"


using namespace ns3;
bool rcvd = 0;


NS_LOG_COMPONENT_DEFINE ("transmission-range");

void ReceivePacket (Ptr<Socket> socket)
{
  //This function displays a message on the screen upon successfully receiving a packet
  rcvd = 1;
  NS_LOG_UNCOND ("Packet received " << rcvd);

}



static void GenerateTraffic (Ptr<Socket> socket, uint32_t pktSize,
                             uint32_t pktCount, Time pktInterval )
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

//This is the main function
int main (int argc, char *argv[])
{
  std::string phyMode ("DsssRate1Mbps"); //We employ DSSS
  double distance;  // meters
  uint32_t packetSize = 1000; // bytes
  uint32_t numNodes = 2;
  uint32_t sinkNode = 1;
  uint32_t sourceNode = 0;
  double txp; //transmission power dB
  std::string m_CSVfileName = "transRangeOutput.csv"; //Output file

  CommandLine cmd;

  cmd.AddValue ("phyMode", "Wifi Phy mode", phyMode);
  cmd.AddValue ("distance", "initial distance (m)", distance);
  cmd.AddValue ("packetSize", "size of packet sent", packetSize);
  cmd.AddValue ("txp", "transmission power", txp);

  cmd.Parse (argc, argv);

  //Display on the screen what we are doing
  NS_LOG_UNCOND ("Testing from node " << sourceNode << " to " << sinkNode);
  NS_LOG_UNCOND ("---------------------------------------------------------- ");


  //Clear the last output file and write the column headers
  std::ofstream out (m_CSVfileName.c_str ());
  out << "Distance," <<
  "TX power," <<
  "Packet rcvd?" <<
  std::endl;
  out.close ();

  txp = 0.1; //Initial power value

  for (int p = 0; p < 5; p++) //Do this for 5 different power values starting at 0.1 dB with a 0.005 dB increment in each iteration
  {

        distance = 180;

	for (int d = 0; d < 10; d++) //Do this for 10 different distance values starting at 180 m with a 0.10 m increment in each iteration
        {

  		//Set Non-unicastMode rate
  		Config::SetDefault ("ns3::WifiRemoteStationManager::NonUnicastMode",StringValue (phyMode));//NonUnicastMode: Wifi mode used for non-unicast transmissions

  		//Create two ad hoc nodes
  		NodeContainer adhocNodes;
  		adhocNodes.Create (numNodes);


  		//Set up wifi phy and channel using helpers
  		WifiHelper wifi;
  		wifi.SetStandard (WIFI_PHY_STANDARD_80211b); //Use 802.11.b standard
  		YansWifiPhyHelper wifiPhy =  YansWifiPhyHelper::Default ();
  		wifiPhy.Set ("RxGain", DoubleValue (-10) ); //Set up the gain at the receiver (in dB)
  		YansWifiChannelHelper wifiChannel;

                //This is where the propagation loss model is defined
                std::string lossModel = "ns3::LogDistancePropagationLossModel";//define the name of the propagation loss model
                //This is the list of attributes used by the propagation loss model used.
                std::string atr1 = "Exponent"; //Set up exponent value of the path loss propagation model
                std::string atr2 = "ReferenceDistance";// The distance at which the reference loss is calculated (m)
                std::string atr3 = "ReferenceLoss";// The reference loss at reference distance (dB)

  		//Here, we add the propagation loss model to the channel, with all the required parameters
  		wifiChannel.AddPropagationLoss (lossModel, atr1, DoubleValue(3), atr2, DoubleValue(1), atr3, DoubleValue(19.41));

  		wifiChannel.SetPropagationDelay ("ns3::ConstantSpeedPropagationDelayModel"); //Set up the propagation delay model
  		wifiPhy.SetChannel (wifiChannel.Create ());

		wifiPhy.Set ("TxPowerStart",DoubleValue (txp));//Set up the transmission power
  		wifiPhy.Set ("TxPowerEnd", DoubleValue (txp));

  		// Add a non-QoS upper MAC, and disable rate control
  		NqosWifiMacHelper wifiMac = NqosWifiMacHelper::Default ();
  		wifi.SetRemoteStationManager ("ns3::ConstantRateWifiManager","DataMode",StringValue (phyMode),"ControlMode",StringValue (phyMode));
  		wifiMac.SetType ("ns3::AdhocWifiMac");// Set MAC to ad hoc mode
  		NetDeviceContainer devices = wifi.Install (wifiPhy, wifiMac, adhocNodes);

  		//Assign IP addresses to nodes
		InternetStackHelper internet;
  		internet.Install (adhocNodes);
  		NS_LOG_INFO ("assigning ip address");
  		Ipv4AddressHelper addressAdhoc;
  		addressAdhoc.SetBase ("10.1.1.0", "255.255.255.0");
  		Ipv4InterfaceContainer i = addressAdhoc.Assign (devices);

  		// Output on the screen current distance value and TX power
  		NS_LOG_UNCOND ("Distance: " << distance << " TX power: " << txp);


  		//Set the position of nodes
  		NS_LOG_INFO ("Installing static mobility; distance " << distance << " .");
  		MobilityHelper mobilityAdhoc;
  		Ptr<ListPositionAllocator> positionAlloc = CreateObject<ListPositionAllocator>();
  		positionAlloc->Add (Vector (0.0, 0.0, 0.0)); //3D coordinates (x,y,z). Use only the x-y plane
  		positionAlloc->Add (Vector (0.0, distance, 0.0)); //we vary the position of this node in each iteration, according to variable distance
  		mobilityAdhoc.SetPositionAllocator (positionAlloc);
  		mobilityAdhoc.Install (adhocNodes);


		//Create custom traffic source and destination(sink)
  		TypeId tid = TypeId::LookupByName ("ns3::UdpSocketFactory");
  		Ptr<Socket> recvSink = Socket::CreateSocket (adhocNodes.Get (sinkNode), tid);
  		InetSocketAddress local = InetSocketAddress (Ipv4Address::GetAny (), 80);
  		recvSink->Bind (local);
  		recvSink->SetRecvCallback (MakeCallback (&ReceivePacket));

  		Ptr<Socket> source = Socket::CreateSocket (adhocNodes.Get (sourceNode), tid);
  		InetSocketAddress remote = InetSocketAddress (i.GetAddress (sinkNode, 0), 80);
  		source->Connect (remote);

  		//Generate the packet (traffic)
  		uint32_t numPackets = 1;
  		double interval = 1.0; // seconds
  		Time interPacketInterval = Seconds (interval);
  		Simulator::Schedule (Seconds (1), &GenerateTraffic, source, packetSize, numPackets, interPacketInterval);


  		//Start the simulation
  		rcvd = 0;
  		Simulator::Stop (Seconds (5.0)); //run each condition (distance, TX power) for 5 seconds
  		Simulator::Run ();


  		//Output results to output file
  		std::ofstream out (m_CSVfileName.c_str (), std::ios::app);

  		out << distance << ","
      			<< txp << ","
      			<< rcvd << ","
      			<< std::endl;

  		out.close ();

                distance = distance + 0.1; //Increase the distance by 0.1 m for next iteration



  		Simulator::Destroy ();
	}

        NS_LOG_UNCOND ("---------------------------------------------------------- ");

        txp = txp + 0.005;  //Increase the power by 0.005 dB for next iteration

  }
  return 0;

}


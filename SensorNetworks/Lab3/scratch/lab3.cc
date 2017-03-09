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
    LAB #3  HIDDEN NODES

    Solution by: Wilson M. Tan (wilson.tan@warwick.ac.uk) based on NS-3 example code
*/



#include <fstream>
#include <iostream>
#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/internet-module.h"
#include "ns3/mobility-module.h"
#include "ns3/wifi-module.h"
#include "ns3/propagation-loss-model.h"
#include "ns3/applications-module.h"
using namespace ns3;
bool rcvd = 0;


NS_LOG_COMPONENT_DEFINE ("hidden-node");


uint32_t PhyRxDropCount1;

//Display a message when a packet is dropped and count the no. of dropped packets
void
PhyRxDrop1(Ptr<const Packet> p)
{
  	NS_LOG_INFO("Packet dropped");
  	PhyRxDropCount1++;
}

//This is the main function
int main (int argc, char *argv[])
{
  	std::string phyMode ("DsssRate1Mbps");//We employ DSSS
  	double distance1 = 180.0;  // meters
  	double distance2 = 300.0;  // meters
  	uint32_t numNodes = 3; //total no. of nodes
  	double txp; //transmission power dB
  	std::string m_CSVfileName = "hiddenNode.csv"; //Output file (comma delimited)
  	CommandLine cmd;

  	cmd.Parse (argc, argv);

	NS_LOG_UNCOND ("===== Running Simulation =====");

  	//Threshold to use RTS/CTS signaling packets
  	Config::SetDefault ("ns3::WifiRemoteStationManager::RtsCtsThreshold", UintegerValue(50));

  	//Clear the last output file and write the column headers
  	std::ofstream out (m_CSVfileName.c_str ());
  	out << "Node2 Y-coordinate," <<
  	"Packets dropped" <<
  	std::endl;
  	out.close ();

	//Do this for 200 interations
    	for(int z = 0; z < 200; z++)
    	{

 		distance1 = 180.0;
        	distance2 = distance2 + 0.5;
        	txp = 1.5;

  		//Create THREE ad hoc nodes
  		NodeContainer adhocNodes;
  		adhocNodes.Create (numNodes);


  		//Set up WiFi PHY and channel using helpers
  		WifiHelper wifi;
  		wifi.SetStandard (WIFI_PHY_STANDARD_80211b); //Use 802.11 standard
  		YansWifiPhyHelper wifiPhy =  YansWifiPhyHelper::Default ();
  		wifiPhy.Set ("RxGain", DoubleValue (-10) ); //Set up the gain at the receiver (in dB)

  		YansWifiChannelHelper wifiChannel;
                std::string lossModel = "ns3::LogDistancePropagationLossModel";//Set up the propagation loss model
                std::string atr1 = "Exponent"; //Set up exponent value of the Path Loss propagation model
                std::string atr2 = "ReferenceDistance";//The distance at which the reference loss is calculated (m)
                std::string atr3 = "ReferenceLoss";//The reference loss at reference distance (dB)

  		wifiChannel.SetPropagationDelay ("ns3::ConstantSpeedPropagationDelayModel"); //Set up the propagation delay model
        wifiChannel.AddPropagationLoss (lossModel, atr1, DoubleValue(3), atr2, DoubleValue(1), atr3, DoubleValue(19.41));
        wifiPhy.SetChannel (wifiChannel.Create ());

        wifiPhy.Set ("TxPowerStart",DoubleValue (txp));//Set up the transmission power
  		wifiPhy.Set ("TxPowerEnd", DoubleValue (txp));

  		//Add a non-QoS upper MAC, and disable rate control
  		NqosWifiMacHelper wifiMac = NqosWifiMacHelper::Default ();
        wifi.SetRemoteStationManager ("ns3::ConstantRateWifiManager",
                                "DataMode",StringValue ("DsssRate2Mbps"),
                                "ControlMode",StringValue ("DsssRate1Mbps"));
  		wifiMac.SetType ("ns3::AdhocWifiMac");// Set MAC to ad hoc mode
  		NetDeviceContainer devices = wifi.Install (wifiPhy, wifiMac, adhocNodes);

  		//Assign IP addresses to nodes
		InternetStackHelper internet;
  		internet.Install (adhocNodes);
  		NS_LOG_INFO ("assigning ip address");
  		Ipv4AddressHelper addressAdhoc;
  		addressAdhoc.SetBase ("10.1.1.0", "255.255.255.0");//First address is for broadcasting (10.1.1.0)
		//10.1.1.1 --> node 0
		//10.1.1.2 --> node 1
		//10.1.1.3 --> node 2
  		Ipv4InterfaceContainer i = addressAdhoc.Assign (devices);

  		//Set the position of nodes
        	NS_LOG_INFO ("Setting position; distance " << distance2 << " .");

  		MobilityHelper mobilityAdhoc;
  		Ptr<ListPositionAllocator> positionAlloc = CreateObject<ListPositionAllocator>();

  		positionAlloc->Add (Vector (0.0, 0.0, 0.0)); //3D coordinates (x,y,z). Use only the x-y plane

  		positionAlloc->Add (Vector (0.0, distance1, 0.0));

  		positionAlloc->Add (Vector (0.0, distance2, 0.0));


  		mobilityAdhoc.SetPositionAllocator (positionAlloc);
  		mobilityAdhoc.Install (adhocNodes);



                //Creates data flows at constant bit rate (data flows), with a packet size = 200
                ApplicationContainer cbrApps;
                uint16_t cbrPort = 12345;
                OnOffHelper onOffHelper ("ns3::UdpSocketFactory", InetSocketAddress (Ipv4Address ("10.1.1.2"), cbrPort));
                //This is where the packet size for the data flows is set
                onOffHelper.SetAttribute ("PacketSize", UintegerValue (200)); //Packet size is 200 for both data flows.
                onOffHelper.SetAttribute ("OnTime",  StringValue ("ns3::ConstantRandomVariable[Constant=1]"));
                onOffHelper.SetAttribute ("OffTime", StringValue ("ns3::ConstantRandomVariable[Constant=0]"));

                //Flow 1:  node 0 -> node 1
                onOffHelper.SetAttribute ("DataRate", StringValue ("9000000bps"));
                onOffHelper.SetAttribute ("StartTime", TimeValue (Seconds (1.000000)));
                cbrApps.Add (onOffHelper.Install (adhocNodes.Get (0)));

                //Flow 2:  node 2 -> node 1
                onOffHelper.SetAttribute ("DataRate", StringValue ("9000001bps"));
                onOffHelper.SetAttribute ("StartTime", TimeValue (Seconds (1.001)));
                cbrApps.Add (onOffHelper.Install (adhocNodes.Get (2)));

                //The following lines send an initial single packet to node 1, a necessary step to initiate the data flows correctly
                uint16_t  echoPort = 9;
                UdpEchoClientHelper echoClientHelper (Ipv4Address ("10.1.1.2"), echoPort);
                echoClientHelper.SetAttribute ("MaxPackets", UintegerValue (1));
                echoClientHelper.SetAttribute ("Interval", TimeValue (Seconds (0.1)));
                echoClientHelper.SetAttribute ("PacketSize", UintegerValue (10));//Size of initial packet
                ApplicationContainer pingApps;

                //Single intial packet from node 0 -> node 1
                echoClientHelper.SetAttribute ("StartTime", TimeValue (Seconds (0.001)));
                pingApps.Add (echoClientHelper.Install (adhocNodes.Get (0)));

                //Single intial packet from node 2 -> node 1
                echoClientHelper.SetAttribute ("StartTime", TimeValue (Seconds (0.006)));
                pingApps.Add (echoClientHelper.Install (adhocNodes.Get (2)));


                //Trace collisions, connect Trace Sink
                Config::ConnectWithoutContext("/NodeList/1/DeviceList/*/$ns3::WifiNetDevice/Phy/PhyRxDrop", MakeCallback(&PhyRxDrop1));

                //Run simulation for 2.5 seconds
                Simulator::Stop (Seconds (2.5));
                Simulator::Run ();

                //Print data to comma delimited file
                std::ofstream out (m_CSVfileName.c_str (), std::ios::app);
                out << distance2 << ", " << PhyRxDropCount1<< "\n";
                out.close ();


                Simulator::Destroy ();
                PhyRxDropCount1 = 0;
        }

	NS_LOG_UNCOND ("===== Simulation Finished =====");

        return 0;

}

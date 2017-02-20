/* -*- Mode:C++; c-file-style:"gnu"; indent-tabs-mode:nil; -*- */

/*
     by: Wilson M. Tan (wilson.tan@warwick.ac.uk), based on Victor Sanchez Exercise 1 solution.

*/
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


NS_LOG_COMPONENT_DEFINE ("NS-3-wifi-basics");

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
  std::string phyMode ("DsssRate1Mbps");
  uint32_t packetSize = 1000; // bytes
  uint32_t numNodes = 2;
  uint32_t sourceNode = 0;
  uint32_t sinkNode = 1;

  		//Set Non-unicastMode rate
  		Config::SetDefault ("ns3::WifiRemoteStationManager::NonUnicastMode",StringValue (phyMode));//NonUnicastMode: Wifi mode used for non-unicast transmissions

  		//1. Create ad hoc nodes
  		NodeContainer adhocNodes;
  		adhocNodes.Create (numNodes);


  		//2. Create a wifihelper, set the standard
  		WifiHelper wifi;
  		wifi.SetStandard (WIFI_PHY_STANDARD_80211b); //Use 802.11.b standard

               	//3. Create a physical layer helper
              	YansWifiPhyHelper wifiPhy =  YansWifiPhyHelper::Default ();

            	//4. Create a wifi channel helper
  		YansWifiChannelHelper wifiChannel;
                	std::string lossModel = "ns3::LogDistancePropagationLossModel"; //Set up the propagation loss model
                	std::string atr1 = "Exponent"; //Set up exponent value of the Path Loss propagation model
                	std::string atr2 = "ReferenceDistance";// The distance at which the reference loss is calculated (m)
                	std::string atr3 = "ReferenceLoss";// The reference loss at reference distance (dB)

  		wifiChannel.SetPropagationDelay ("ns3::ConstantSpeedPropagationDelayModel"); //Set up the propagation delay model
                 wifiChannel.AddPropagationLoss (lossModel, atr1, DoubleValue(2.5), atr2, DoubleValue(15), atr3, DoubleValue(-0.5));

        		//5. Using the wifi channel helper, setup the physical layer helper
        		wifiPhy.SetChannel (wifiChannel.Create ());

  		//6. Create a wifimac helper, set it up
  		NqosWifiMacHelper wifiMac = NqosWifiMacHelper::Default ();
  		wifiMac.SetType ("ns3::AdhocWifiMac");// Set MAC to adhoc mode

        		//7. Set the wifihelper's remote station manager. Create a netdevice container.
        		wifi.SetRemoteStationManager ("ns3::ConstantRateWifiManager","DataMode",StringValue (phyMode),"ControlMode",StringValue (phyMode));
  		NetDeviceContainer devices = wifi.Install (wifiPhy, wifiMac, adhocNodes);

  		//8. Assign IP addresses to nodes
		InternetStackHelper internet;
  		internet.Install (adhocNodes);
  		Ipv4AddressHelper addressAdhoc;
  		addressAdhoc.SetBase ("10.1.1.0", "255.255.255.0");
  		Ipv4InterfaceContainer i = addressAdhoc.Assign (devices);


        		//9. Assign locations to nodes.
  		MobilityHelper mobilityAdhoc;
  		Ptr<ListPositionAllocator> positionAlloc = CreateObject<ListPositionAllocator>();
  		//First node
  		positionAlloc->Add (Vector (0.0, 0.0, 0.0)); //3D coordinates (x,y,z). Use only the x-y plane
  		//Second node
  		positionAlloc->Add (Vector (0.0, 1.0, 0.0));
  		mobilityAdhoc.SetPositionAllocator (positionAlloc);
  		mobilityAdhoc.Install (adhocNodes);


		//10. Setup sockets.
  		TypeId tid = TypeId::LookupByName ("ns3::UdpSocketFactory");
  		Ptr<Socket> recvSink = Socket::CreateSocket (adhocNodes.Get (sinkNode), tid);
  		InetSocketAddress local = InetSocketAddress (Ipv4Address::GetAny (), 80);
  		recvSink->Bind (local);
  		recvSink->SetRecvCallback (MakeCallback (&ReceivePacket));

  		Ptr<Socket> source = Socket::CreateSocket (adhocNodes.Get (sourceNode), tid);
  		InetSocketAddress remote = InetSocketAddress (i.GetAddress (sinkNode, 0), 80);
  		source->Connect (remote);

  		//11. Generate the packet (traffic)
           	uint32_t numPackets = 10;
  		double interval = 0.5; // seconds
  		Time interPacketInterval = Seconds (interval);

  		Simulator::Schedule (Seconds (0.001), &GenerateTraffic, source, packetSize, numPackets, interPacketInterval);


  		//12. Run the simulation.
  		rcvd = 0;
  		Simulator::Stop (Seconds (10.0));
  		Simulator::Run ();

        		Simulator::Destroy ();

        		return 0;

}


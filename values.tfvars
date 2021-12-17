rg_name     = "my-resources1"
location = "East US"
#routetable= ["subnet1-rt","subnet2-rt"]

vnet = [
    {name = "hub-vnet" ,address_space= "10.0.0.0/16"}, 
    {name = "spoke1-vnet",address_space= "20.0.0.0/16"}, 
    {name = "spoke2-vnet",address_space= "30.0.0.0/16"} 
]

subnet = [

{name = "spoke1-vnet", subnet_name = "spoke1-subnet",address_prefix= "20.0.0.0/24"},
{name = "spoke2-vnet", subnet_name = "spoke2-subnet",address_prefix= "30.0.0.0/24"},
{name = "hub-vnet", subnet_name = "AzureFirewallSubnet" ,address_prefix= "10.0.0.0/24"}

]

FirewallRG = "Public_Firewall_RG"
publicIPname = "firewallpublicIP"
Firewall = "FirewallPriv"


route_table = ["routetable1","routetable2"]

#routetable1 = [,"routetable2","routetable1","routetable2"]

route1 = [
 {routetable = "routetable1", name = "default",address_prefix = "0.0.0.0/0", next_hop_type = "VirtualAppliance"},
 {routetable = "routetable2",name = "spoke1tospoke2", address_prefix = "30.0.0.0/24", next_hop_type = "VirtualAppliance"}, 
 {routetable = "routetable1",name ="spoke2tospoke1",address_prefix = "20.0.0.0/24", next_hop_type = "VirtualAppliance"},
 {routetable = "routetable2",name = "default",address_prefix = "0.0.0.0/0", next_hop_type = "VirtualAppliance"}
 
]

routetableassociate = [
    {subnetlistloc = 1, routetablelistloc = 0},
    {subnetlistloc = 0, routetablelistloc = 1}
    ]

    #["a","b"}
    #
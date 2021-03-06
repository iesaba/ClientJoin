#include <sourcemod>
#include <geoip>

public Plugin:myinfo = {
	name        = "ClientJoin",
	author      = "Smooth & k725",
	description = "Join Announce",
	version     = "1.0",
	url         = ""
};

public OnClientPutInServer(client)
{
	new String:name[32],
		String:ip[32],
		String:country[4],
		String:steamid[32];

	// プレイヤーネーム
	GetClientName(client, name, sizeof(name));

	// 国
	GetClientIP(client, ip, sizeof(ip));
	if (!GeoipCode3(ip, country))
		country = "ERR";
	
	// Steam ID
	GetClientAuthString(client, steamid, sizeof(steamid));

	PrintToChatAll("[Iesaba] \x04%s\x01 has joined (\x08%s\x01)", name, country);
	LogMessage("%s(%s) has joined (%s) %s", name, steamid, country, ip);
}

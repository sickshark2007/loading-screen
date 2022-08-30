#include <a_samp>

new PlayerText:PlayerTD[MAX_PLAYERS][4], Float:g_LoadingF[MAX_PLAYERS]; 

hook OnPlayerConnect(playerid)
{
    g_LoadingF[playerid] = 0;
    CarregarTDELoad(playerid);
    LoadingTDE(playerid, true);
    return 1;
}

forward LoadingTDE(playerid, bool:visible);
public LoadingTDE(playerid, bool:visible)
{
    if(!visible)
    {
        for(new i; i < 4; i++)
        {
            PlayerTextDrawHide(playerid, PlayerTD[playerid][i]);
        }
    }
    else
    {
        for(new i; i < 4; i++)
        {
            PlayerTextDrawShow(playerid, PlayerTD[playerid][i]);
        }
        SetTimerEx("UpdateLoad", 18, false, "i", playerid);
    }
    return 1;
}

forward CarregarTDELoad(playerid);
public CarregarTDELoad(playerid)
{
    PlayerTD[playerid][0] = CreatePlayerTextDraw(playerid, 320.000000, -6.000000, "_");
    PlayerTextDrawFont(playerid, PlayerTD[playerid][0], 1);
    PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][0], 0.600000, 51.100002);
    PlayerTextDrawTextSize(playerid, PlayerTD[playerid][0], 298.500000, 643.500000);
    PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, PlayerTD[playerid][0], 2);
    PlayerTextDrawColor(playerid, PlayerTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][0], 255);
    PlayerTextDrawUseBox(playerid, PlayerTD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][0], 0);

    PlayerTD[playerid][1] = CreatePlayerTextDraw(playerid, 219.000000, 211.000000, "UNITED ROLEPLAY");
    PlayerTextDrawFont(playerid, PlayerTD[playerid][1], 2);
    PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][1], 0.554166, 2.399998);
    PlayerTextDrawTextSize(playerid, PlayerTD[playerid][1], 466.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, PlayerTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, PlayerTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, PlayerTD[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][1], 0);

    PlayerTD[playerid][2] = CreatePlayerTextDraw(playerid, 405.000000, 228.000000, "_"); //desbug
    PlayerTextDrawFont(playerid, PlayerTD[playerid][2], 2);
    PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][2], 0.137499, 0.900000);
    PlayerTextDrawTextSize(playerid, PlayerTD[playerid][2], 466.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, PlayerTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, PlayerTD[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, PlayerTD[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][2], 0);

    PlayerTD[playerid][3] = CreatePlayerTextDraw(playerid, 756.000000, -6.000000, "_");
    PlayerTextDrawFont(playerid, PlayerTD[playerid][3], 1);
    PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][3], 0.600000, 51.100002);
    PlayerTextDrawTextSize(playerid, PlayerTD[playerid][3], -250.000000, 1081.500000);
    PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][3], 2);
    PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, PlayerTD[playerid][3], 2);
    PlayerTextDrawColor(playerid, PlayerTD[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][3], 229);
    PlayerTextDrawUseBox(playerid, PlayerTD[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][3], 0);
    return 1;
}

forward UpdateLoad(playerid);
public UpdateLoad(playerid) // 1073 = cinza / 646 = branco
{
    if(g_LoadingF[playerid] > 455)
    {
        SpawnPlayer(playerid);
        return LoadingTDE(playerid, false);
    }

    PlayerTextDrawTextSize(playerid, PlayerTD[playerid][3], -250, (1081.500000 - g_LoadingF[playerid]));
    PlayerTextDrawShow(playerid, PlayerTD[playerid][3]);
    g_LoadingF[playerid] += 1;

    return SetTimerEx("UpdateLoad", 40, false, "i", playerid);
}

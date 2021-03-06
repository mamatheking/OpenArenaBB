data
align 4
LABELV specifypassword_artlist
address $79
address $80
address $81
address $82
address $83
address $84
byte 4 0
code
proc SpecifyPassword_Event 8 8
file "../../../code/q3_ui/ui_password.c"
line 73
;1:/*
;2:===========================================================================
;3:Copyright (C) 2009 Poul Sander
;4:
;5:This file is part of the Open Arena source code.
;6:
;7:Open Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Open Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Open Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22://
;23:#include "ui_local.h"
;24:
;25:/*********************************************************************************
;26:	SPECIFY PASSWORD
;27:*********************************************************************************/
;28:
;29:#define SPECIFYPASSWORD_FRAMEL	"menu/art_blueish/frame2_l"
;30:#define SPECIFYPASSWORD_FRAMER	"menu/art_blueish/frame1_r"
;31:#define SPECIFYPASSWORD_BACK0		"menu/art_blueish/back_0"
;32:#define SPECIFYPASSWORD_BACK1		"menu/art_blueish/back_1"
;33:#define SPECIFYPASSWORD_FIGHT0	"menu/art_blueish/fight_0"
;34:#define SPECIFYPASSWORD_FIGHT1	"menu/art_blueish/fight_1"
;35:
;36:#define ID_SPECIFYPASSWORDBACK	102
;37:#define ID_SPECIFYPASSWORDGO		103
;38:
;39:static char* specifypassword_artlist[] =
;40:{
;41:	SPECIFYPASSWORD_FRAMEL,
;42:	SPECIFYPASSWORD_FRAMER,
;43:	SPECIFYPASSWORD_BACK0,	
;44:	SPECIFYPASSWORD_BACK1,	
;45:	SPECIFYPASSWORD_FIGHT0,
;46:	SPECIFYPASSWORD_FIGHT1,
;47:	NULL
;48:};
;49:
;50:typedef struct
;51:{
;52:	menuframework_s	menu;
;53:	menutext_s	banner;
;54:	menubitmap_s	framel;
;55:	menubitmap_s	framer;
;56:	menutext_s	info;
;57:	menufield_s	password;
;58:	menubitmap_s	go;
;59:	menubitmap_s	back;
;60:
;61:	char		*connectstring;
;62:        char            servername[32];
;63:} specifypassword_t;
;64:
;65:static specifypassword_t	s_specifypassword;
;66:
;67:/*
;68:=================
;69:SpecifyPassword_Event
;70:=================
;71:*/
;72:static void SpecifyPassword_Event( void* ptr, int event ) 
;73:{
line 74
;74:	switch (((menucommon_s*)ptr)->id)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 102
EQI4 $103
ADDRLP4 0
INDIRI4
CNSTI4 103
EQI4 $90
ADDRGP4 $87
JUMPV
line 75
;75:	{
LABELV $90
line 77
;76:		case ID_SPECIFYPASSWORDGO:
;77:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $91
line 78
;78:				break;
ADDRGP4 $88
JUMPV
LABELV $91
line 80
;79:
;80:			if (s_specifypassword.password.field.buffer[0])
ADDRGP4 s_specifypassword+736+60+12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $88
line 81
;81:			{
line 82
;82:				trap_Cvar_Set("password",s_specifypassword.password.field.buffer);
ADDRGP4 $98
ARGP4
ADDRGP4 s_specifypassword+736+60+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 83
;83:				trap_Cmd_ExecuteText( EXEC_APPEND, s_specifypassword.connectstring );
CNSTI4 2
ARGI4
ADDRGP4 s_specifypassword+1244
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 84
;84:			}
line 85
;85:			break;
ADDRGP4 $88
JUMPV
LABELV $103
line 88
;86:
;87:		case ID_SPECIFYPASSWORDBACK:
;88:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $104
line 89
;89:				break;
ADDRGP4 $88
JUMPV
LABELV $104
line 91
;90:
;91:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 92
;92:			break;
LABELV $87
LABELV $88
line 94
;93:	}
;94:}
LABELV $86
endproc SpecifyPassword_Event 8 8
export SpecifyPassword_MenuInit
proc SpecifyPassword_MenuInit 0 12
line 102
;95:
;96:/*
;97:=================
;98:SpecifyPassword_MenuInit
;99:=================
;100:*/
;101:void SpecifyPassword_MenuInit( void )
;102:{
line 104
;103:	// zero set all our globals
;104:	memset( &s_specifypassword, 0 ,sizeof(specifypassword_t) );
ADDRGP4 s_specifypassword
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1280
ARGI4
ADDRGP4 memset
CALLP4
pop
line 106
;105:
;106:	SpecifyPassword_Cache();
ADDRGP4 SpecifyPassword_Cache
CALLV
pop
line 108
;107:
;108:	s_specifypassword.menu.wrapAround = qtrue;
ADDRGP4 s_specifypassword+404
CNSTI4 1
ASGNI4
line 109
;109:	s_specifypassword.menu.fullscreen = qtrue;
ADDRGP4 s_specifypassword+408
CNSTI4 1
ASGNI4
line 111
;110:
;111:	s_specifypassword.banner.generic.type	 = MTYPE_BTEXT;
ADDRGP4 s_specifypassword+416
CNSTI4 10
ASGNI4
line 112
;112:	s_specifypassword.banner.generic.x     = 320;
ADDRGP4 s_specifypassword+416+12
CNSTI4 320
ASGNI4
line 113
;113:	s_specifypassword.banner.generic.y     = 16;
ADDRGP4 s_specifypassword+416+16
CNSTI4 16
ASGNI4
line 114
;114:	s_specifypassword.banner.string		 = "SPECIFY PASSWORD";
ADDRGP4 s_specifypassword+416+60
ADDRGP4 $116
ASGNP4
line 115
;115:	s_specifypassword.banner.color  		 = color_white;
ADDRGP4 s_specifypassword+416+68
ADDRGP4 color_white
ASGNP4
line 116
;116:	s_specifypassword.banner.style  		 = UI_CENTER;
ADDRGP4 s_specifypassword+416+64
CNSTI4 1
ASGNI4
line 118
;117:
;118:	s_specifypassword.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifypassword+488
CNSTI4 6
ASGNI4
line 119
;119:	s_specifypassword.framel.generic.name  = SPECIFYPASSWORD_FRAMEL;
ADDRGP4 s_specifypassword+488+4
ADDRGP4 $79
ASGNP4
line 120
;120:	s_specifypassword.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifypassword+488+44
CNSTU4 16384
ASGNU4
line 121
;121:	s_specifypassword.framel.generic.x	 = 0;  
ADDRGP4 s_specifypassword+488+12
CNSTI4 0
ASGNI4
line 122
;122:	s_specifypassword.framel.generic.y	 = 78;
ADDRGP4 s_specifypassword+488+16
CNSTI4 78
ASGNI4
line 123
;123:	s_specifypassword.framel.width  	     = 256;
ADDRGP4 s_specifypassword+488+76
CNSTI4 256
ASGNI4
line 124
;124:	s_specifypassword.framel.height  	     = 329;
ADDRGP4 s_specifypassword+488+80
CNSTI4 329
ASGNI4
line 126
;125:
;126:	s_specifypassword.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifypassword+576
CNSTI4 6
ASGNI4
line 127
;127:	s_specifypassword.framer.generic.name  = SPECIFYPASSWORD_FRAMER;
ADDRGP4 s_specifypassword+576+4
ADDRGP4 $80
ASGNP4
line 128
;128:	s_specifypassword.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifypassword+576+44
CNSTU4 16384
ASGNU4
line 129
;129:	s_specifypassword.framer.generic.x	 = 376;
ADDRGP4 s_specifypassword+576+12
CNSTI4 376
ASGNI4
line 130
;130:	s_specifypassword.framer.generic.y	 = 76;
ADDRGP4 s_specifypassword+576+16
CNSTI4 76
ASGNI4
line 131
;131:	s_specifypassword.framer.width  	     = 256;
ADDRGP4 s_specifypassword+576+76
CNSTI4 256
ASGNI4
line 132
;132:	s_specifypassword.framer.height  	     = 334;
ADDRGP4 s_specifypassword+576+80
CNSTI4 334
ASGNI4
line 134
;133:
;134:	s_specifypassword.info.generic.type	 = MTYPE_TEXT;
ADDRGP4 s_specifypassword+664
CNSTI4 7
ASGNI4
line 135
;135:	s_specifypassword.info.generic.x     = 320;
ADDRGP4 s_specifypassword+664+12
CNSTI4 320
ASGNI4
line 136
;136:	s_specifypassword.info.generic.y     = 160;
ADDRGP4 s_specifypassword+664+16
CNSTI4 160
ASGNI4
line 137
;137:	s_specifypassword.info.color  		 = color_white;
ADDRGP4 s_specifypassword+664+68
ADDRGP4 color_white
ASGNP4
line 138
;138:	s_specifypassword.info.style  		 = UI_CENTER;
ADDRGP4 s_specifypassword+664+64
CNSTI4 1
ASGNI4
line 139
;139:        s_specifypassword.info.string           = s_specifypassword.servername;
ADDRGP4 s_specifypassword+664+60
ADDRGP4 s_specifypassword+1248
ASGNP4
line 141
;140:
;141:	s_specifypassword.password.generic.type       = MTYPE_FIELD;
ADDRGP4 s_specifypassword+736
CNSTI4 4
ASGNI4
line 142
;142:	s_specifypassword.password.generic.name       = "Password:";
ADDRGP4 s_specifypassword+736+4
ADDRGP4 $162
ASGNP4
line 143
;143:	s_specifypassword.password.generic.flags      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_specifypassword+736+44
CNSTU4 258
ASGNU4
line 144
;144:	s_specifypassword.password.generic.x	      = 206;
ADDRGP4 s_specifypassword+736+12
CNSTI4 206
ASGNI4
line 145
;145:	s_specifypassword.password.generic.y	      = 220;
ADDRGP4 s_specifypassword+736+16
CNSTI4 220
ASGNI4
line 146
;146:	s_specifypassword.password.field.widthInChars = 38;
ADDRGP4 s_specifypassword+736+60+8
CNSTI4 38
ASGNI4
line 147
;147:	s_specifypassword.password.field.maxchars     = 80;
ADDRGP4 s_specifypassword+736+60+268
CNSTI4 80
ASGNI4
line 148
;148:	trap_Cvar_VariableStringBuffer("password",s_specifypassword.password.field.buffer,80);
ADDRGP4 $98
ARGP4
ADDRGP4 s_specifypassword+736+60+12
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 150
;149:
;150:	s_specifypassword.go.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_specifypassword+1068
CNSTI4 6
ASGNI4
line 151
;151:	s_specifypassword.go.generic.name     = SPECIFYPASSWORD_FIGHT0;
ADDRGP4 s_specifypassword+1068+4
ADDRGP4 $83
ASGNP4
line 152
;152:	s_specifypassword.go.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_specifypassword+1068+44
CNSTU4 272
ASGNU4
line 153
;153:	s_specifypassword.go.generic.callback = SpecifyPassword_Event;
ADDRGP4 s_specifypassword+1068+48
ADDRGP4 SpecifyPassword_Event
ASGNP4
line 154
;154:	s_specifypassword.go.generic.id	    = ID_SPECIFYPASSWORDGO;
ADDRGP4 s_specifypassword+1068+8
CNSTI4 103
ASGNI4
line 155
;155:	s_specifypassword.go.generic.x		= 640;
ADDRGP4 s_specifypassword+1068+12
CNSTI4 640
ASGNI4
line 156
;156:	s_specifypassword.go.generic.y		= 480-64;
ADDRGP4 s_specifypassword+1068+16
CNSTI4 416
ASGNI4
line 157
;157:	s_specifypassword.go.width  		    = 128;
ADDRGP4 s_specifypassword+1068+76
CNSTI4 128
ASGNI4
line 158
;158:	s_specifypassword.go.height  		    = 64;
ADDRGP4 s_specifypassword+1068+80
CNSTI4 64
ASGNI4
line 159
;159:	s_specifypassword.go.focuspic         = SPECIFYPASSWORD_FIGHT1;
ADDRGP4 s_specifypassword+1068+60
ADDRGP4 $84
ASGNP4
line 161
;160:
;161:	s_specifypassword.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_specifypassword+1156
CNSTI4 6
ASGNI4
line 162
;162:	s_specifypassword.back.generic.name     = SPECIFYPASSWORD_BACK0;
ADDRGP4 s_specifypassword+1156+4
ADDRGP4 $81
ASGNP4
line 163
;163:	s_specifypassword.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_specifypassword+1156+44
CNSTU4 260
ASGNU4
line 164
;164:	s_specifypassword.back.generic.callback = SpecifyPassword_Event;
ADDRGP4 s_specifypassword+1156+48
ADDRGP4 SpecifyPassword_Event
ASGNP4
line 165
;165:	s_specifypassword.back.generic.id	      = ID_SPECIFYPASSWORDBACK;
ADDRGP4 s_specifypassword+1156+8
CNSTI4 102
ASGNI4
line 166
;166:	s_specifypassword.back.generic.x		  = 0;
ADDRGP4 s_specifypassword+1156+12
CNSTI4 0
ASGNI4
line 167
;167:	s_specifypassword.back.generic.y		  = 480-64;
ADDRGP4 s_specifypassword+1156+16
CNSTI4 416
ASGNI4
line 168
;168:	s_specifypassword.back.width  		  = 128;
ADDRGP4 s_specifypassword+1156+76
CNSTI4 128
ASGNI4
line 169
;169:	s_specifypassword.back.height  		  = 64;
ADDRGP4 s_specifypassword+1156+80
CNSTI4 64
ASGNI4
line 170
;170:	s_specifypassword.back.focuspic         = SPECIFYPASSWORD_BACK1;
ADDRGP4 s_specifypassword+1156+60
ADDRGP4 $82
ASGNP4
line 172
;171:
;172:	Menu_AddItem( &s_specifypassword.menu, &s_specifypassword.banner );
ADDRGP4 s_specifypassword
ARGP4
ADDRGP4 s_specifypassword+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 173
;173:	Menu_AddItem( &s_specifypassword.menu, &s_specifypassword.info );
ADDRGP4 s_specifypassword
ARGP4
ADDRGP4 s_specifypassword+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 174
;174:	Menu_AddItem( &s_specifypassword.menu, &s_specifypassword.framel );
ADDRGP4 s_specifypassword
ARGP4
ADDRGP4 s_specifypassword+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 175
;175:	Menu_AddItem( &s_specifypassword.menu, &s_specifypassword.framer );
ADDRGP4 s_specifypassword
ARGP4
ADDRGP4 s_specifypassword+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 176
;176:	Menu_AddItem( &s_specifypassword.menu, &s_specifypassword.password );
ADDRGP4 s_specifypassword
ARGP4
ADDRGP4 s_specifypassword+736
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 177
;177:	Menu_AddItem( &s_specifypassword.menu, &s_specifypassword.go );
ADDRGP4 s_specifypassword
ARGP4
ADDRGP4 s_specifypassword+1068
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 178
;178:	Menu_AddItem( &s_specifypassword.menu, &s_specifypassword.back );
ADDRGP4 s_specifypassword
ARGP4
ADDRGP4 s_specifypassword+1156
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 179
;179:}
LABELV $106
endproc SpecifyPassword_MenuInit 0 12
export SpecifyPassword_Cache
proc SpecifyPassword_Cache 4 4
line 187
;180:
;181:/*
;182:=================
;183:SpecifyPassword_Cache
;184:=================
;185:*/
;186:void SpecifyPassword_Cache( void )
;187:{
line 191
;188:	int	i;
;189:
;190:	// touch all our pics
;191:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $224
line 192
;192:	{
line 193
;193:		if (!specifypassword_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifypassword_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $228
line 194
;194:			break;
ADDRGP4 $226
JUMPV
LABELV $228
line 195
;195:		trap_R_RegisterShaderNoMip(specifypassword_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifypassword_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 196
;196:	}
LABELV $225
line 191
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $224
JUMPV
LABELV $226
line 197
;197:}
LABELV $223
endproc SpecifyPassword_Cache 4 4
export UI_SpecifyPasswordMenu
proc UI_SpecifyPasswordMenu 0 12
line 205
;198:
;199:/*
;200:=================
;201:UI_SpecifyPasswordMenu
;202:=================
;203:*/
;204:void UI_SpecifyPasswordMenu( char* string, char *name )
;205:{
line 206
;206:	SpecifyPassword_MenuInit();
ADDRGP4 SpecifyPassword_MenuInit
CALLV
pop
line 207
;207:	s_specifypassword.connectstring = string;
ADDRGP4 s_specifypassword+1244
ADDRFP4 0
INDIRP4
ASGNP4
line 208
;208:        Q_strncpyz(s_specifypassword.servername,name,32);
ADDRGP4 s_specifypassword+1248
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 209
;209:	UI_PushMenu( &s_specifypassword.menu );
ADDRGP4 s_specifypassword
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 210
;210:}
LABELV $230
endproc UI_SpecifyPasswordMenu 0 12
bss
align 4
LABELV s_specifypassword
skip 1280
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import UI_VoteCustomMenu
import UI_FirstConnectMenu
import FirstConnect_Cache
import UI_VoteMapMenuInternal
import UI_VoteMapMenu
import UI_VoteKickMenu
import UI_VoteGametypeMenu
import UI_VoteTimelimitMenu
import UI_VoteFraglimitMenu
import UI_VoteMenuMenu
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import UI_Challenges
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_SetDefaultCvar
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import mappage
import ui_browserOnlyHumans
import ui_setupchecked
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_dom_friendly
import ui_dom_timelimit
import ui_dom_capturelimit
import ui_dd_friendly
import ui_dd_timelimit
import ui_dd_capturelimit
import ui_lms_timelimit
import ui_lms_fraglimit
import ui_ctf_elimination_timelimit
import ui_ctf_elimination_capturelimit
import ui_elimination_timelimit
import ui_elimination_capturelimit
import ui_harvester_friendly
import ui_harvester_timelimit
import ui_harvester_capturelimit
import ui_overload_friendly
import ui_overload_timelimit
import ui_overload_capturelimit
import ui_1fctf_friendly
import ui_1fctf_timelimit
import ui_1fctf_capturelimit
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import BG_TeamName
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_DefragmentMemory
import BG_Free
import BG_InitMemory
import BG_Alloc
import BG_CanAlloc
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import Com_TruncateLongString
import va
import Q_CountChar
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_stristr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_RandomBytes
import Com_SkipCharset
import Com_SkipTokens
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_GetExtension
import COM_SkipPath
import Com_Clamp
import Q_isnan
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoundsIntersectPoint
import BoundsIntersectSphere
import BoundsIntersect
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import Q_snprintf
import Q_vsnprintf
import strtol
import _atoi
import atoi
import strtod
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strrchr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $162
byte 1 80
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $116
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 73
byte 1 70
byte 1 89
byte 1 32
byte 1 80
byte 1 65
byte 1 83
byte 1 83
byte 1 87
byte 1 79
byte 1 82
byte 1 68
byte 1 0
align 1
LABELV $98
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $84
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $83
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $82
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $81
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $80
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $79
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 95
byte 1 108
byte 1 0

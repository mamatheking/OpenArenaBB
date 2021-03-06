data
align 4
LABELV teamoverlay_names
address $80
address $81
address $82
address $83
byte 4 0
code
proc Preferences_SetMenuItems 136 12
file "../../../code/q3_ui/ui_preferences.c"
line 112
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:
;5:This file is part of Quake III Arena source code.
;6:
;7:Quake III Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Quake III Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Quake III Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22://
;23:/*
;24:=======================================================================
;25:
;26:GAME OPTIONS MENU
;27:
;28:=======================================================================
;29:*/
;30:
;31:
;32:#include "ui_local.h"
;33:
;34:
;35:#define ART_FRAMEL				"menu/art_blueish/frame2_l"
;36:#define ART_FRAMER				"menu/art_blueish/frame1_r"
;37:#define ART_BACK0				"menu/art_blueish/back_0"
;38:#define ART_BACK1				"menu/art_blueish/back_1"
;39:
;40:#define PREFERENCES_X_POS		360
;41:
;42:#define ID_CROSSHAIR			127
;43:#define ID_SIMPLEITEMS			128
;44:#define ID_HIGHQUALITYSKY		129
;45:#define ID_EJECTINGBRASS		130
;46:#define ID_WALLMARKS			131
;47:#define ID_DYNAMICLIGHTS		132
;48:#define ID_IDENTIFYTARGET		133
;49:#define ID_SYNCEVERYFRAME		134
;50:#define ID_FORCEMODEL			135
;51:#define ID_DRAWTEAMOVERLAY		136
;52:#define ID_ALLOWDOWNLOAD			137
;53:#define ID_BACK					138
;54://Elimination
;55:#define ID_WEAPONBAR                    139
;56:#define ID_DELAGHITSCAN		140
;57:#define ID_COLORRED             141
;58:#define ID_COLORGREEN           142
;59:#define ID_COLORBLUE            143
;60:#define ID_CROSSHAIRHEALTH      144
;61:#define ID_CHATBEEP             145
;62:#define ID_TEAMCHATBEEP         146
;63:
;64:#define	NUM_CROSSHAIRS			99
;65:
;66:
;67:typedef struct {
;68:	menuframework_s		menu;
;69:
;70:	menutext_s			banner;
;71:	menubitmap_s		framel;
;72:	menubitmap_s		framer;
;73:
;74:	menulist_s			crosshair;
;75:        menuradiobutton_s	crosshairHealth;
;76:
;77:        //Crosshair colors:
;78:        menuslider_s            crosshairColorRed;
;79:        menuslider_s            crosshairColorGreen;
;80:        menuslider_s            crosshairColorBlue;
;81:
;82:	menuradiobutton_s	simpleitems;
;83:        menuradiobutton_s	alwaysweaponbar;
;84:	menuradiobutton_s	brass;
;85:	menuradiobutton_s	wallmarks;
;86:	menuradiobutton_s	dynamiclights;
;87:	menuradiobutton_s	identifytarget;
;88:	menuradiobutton_s	highqualitysky;
;89:	menuradiobutton_s	synceveryframe;
;90:	menuradiobutton_s	forcemodel;
;91:	menulist_s			drawteamoverlay;
;92:        menuradiobutton_s	delaghitscan;
;93:	menuradiobutton_s	allowdownload;
;94:        menuradiobutton_s       chatbeep;
;95:        menuradiobutton_s       teamchatbeep;
;96:	menubitmap_s		back;
;97:
;98:	qhandle_t			crosshairShader[NUM_CROSSHAIRS];
;99:} preferences_t;
;100:
;101:static preferences_t s_preferences;
;102:
;103:static const char *teamoverlay_names[] =
;104:{
;105:	"off",
;106:	"upper right",
;107:	"lower right",
;108:	"lower left",
;109:	NULL
;110:};
;111:
;112:static void Preferences_SetMenuItems( void ) {
line 113
;113:	s_preferences.crosshair.curvalue		= (int)trap_Cvar_VariableValue( "cg_drawCrosshair" ) % NUM_CROSSHAIRS;
ADDRGP4 $87
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_preferences+664+64
ADDRLP4 0
INDIRF4
CVFI4 4
CNSTI4 99
MODI4
ASGNI4
line 114
;114:        s_preferences.crosshairHealth.curvalue          = trap_Cvar_VariableValue( "cg_crosshairHealth") != 0;
ADDRGP4 $90
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
EQF4 $92
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $93
JUMPV
LABELV $92
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $93
ADDRGP4 s_preferences+760+60
ADDRLP4 4
INDIRI4
ASGNI4
line 115
;115:        s_preferences.crosshairColorRed.curvalue        = trap_Cvar_VariableValue( "cg_crosshairColorRed")*255.0f;
ADDRGP4 $96
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_preferences+824+68
CNSTF4 1132396544
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 116
;116:        s_preferences.crosshairColorGreen.curvalue      = trap_Cvar_VariableValue( "cg_crosshairColorGreen")*255.0f;
ADDRGP4 $99
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_preferences+900+68
CNSTF4 1132396544
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 117
;117:        s_preferences.crosshairColorBlue.curvalue       = trap_Cvar_VariableValue( "cg_crosshairColorBlue")*255.0f;
ADDRGP4 $102
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_preferences+976+68
CNSTF4 1132396544
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 118
;118:	s_preferences.simpleitems.curvalue		= trap_Cvar_VariableValue( "cg_simpleItems" ) != 0;
ADDRGP4 $105
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
EQF4 $107
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $107
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $108
ADDRGP4 s_preferences+1052+60
ADDRLP4 24
INDIRI4
ASGNI4
line 119
;119:        s_preferences.alwaysweaponbar.curvalue		= trap_Cvar_VariableValue( "cg_alwaysWeaponBar" ) != 0;
ADDRGP4 $111
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 0
EQF4 $113
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRGP4 $114
JUMPV
LABELV $113
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $114
ADDRGP4 s_preferences+1116+60
ADDRLP4 32
INDIRI4
ASGNI4
line 120
;120:	s_preferences.brass.curvalue			= trap_Cvar_VariableValue( "cg_brassTime" ) != 0;
ADDRGP4 $117
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 0
EQF4 $119
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRGP4 $120
JUMPV
LABELV $119
ADDRLP4 40
CNSTI4 0
ASGNI4
LABELV $120
ADDRGP4 s_preferences+1180+60
ADDRLP4 40
INDIRI4
ASGNI4
line 121
;121:	s_preferences.wallmarks.curvalue		= trap_Cvar_VariableValue( "cg_marks" ) != 0;
ADDRGP4 $123
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 0
EQF4 $125
ADDRLP4 48
CNSTI4 1
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $125
ADDRLP4 48
CNSTI4 0
ASGNI4
LABELV $126
ADDRGP4 s_preferences+1244+60
ADDRLP4 48
INDIRI4
ASGNI4
line 122
;122:	s_preferences.identifytarget.curvalue	= trap_Cvar_VariableValue( "cg_drawCrosshairNames" ) != 0;
ADDRGP4 $129
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 60
INDIRF4
CNSTF4 0
EQF4 $131
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $131
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $132
ADDRGP4 s_preferences+1372+60
ADDRLP4 56
INDIRI4
ASGNI4
line 123
;123:	s_preferences.dynamiclights.curvalue	= trap_Cvar_VariableValue( "r_dynamiclight" ) != 0;
ADDRGP4 $135
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 68
INDIRF4
CNSTF4 0
EQF4 $137
ADDRLP4 64
CNSTI4 1
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $137
ADDRLP4 64
CNSTI4 0
ASGNI4
LABELV $138
ADDRGP4 s_preferences+1308+60
ADDRLP4 64
INDIRI4
ASGNI4
line 124
;124:	s_preferences.highqualitysky.curvalue	= trap_Cvar_VariableValue ( "r_fastsky" ) == 0;
ADDRGP4 $141
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 76
INDIRF4
CNSTF4 0
NEF4 $143
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $143
ADDRLP4 72
CNSTI4 0
ASGNI4
LABELV $144
ADDRGP4 s_preferences+1436+60
ADDRLP4 72
INDIRI4
ASGNI4
line 125
;125:	s_preferences.synceveryframe.curvalue	= trap_Cvar_VariableValue( "r_finish" ) != 0;
ADDRGP4 $147
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 84
INDIRF4
CNSTF4 0
EQF4 $149
ADDRLP4 80
CNSTI4 1
ASGNI4
ADDRGP4 $150
JUMPV
LABELV $149
ADDRLP4 80
CNSTI4 0
ASGNI4
LABELV $150
ADDRGP4 s_preferences+1500+60
ADDRLP4 80
INDIRI4
ASGNI4
line 126
;126:	s_preferences.forcemodel.curvalue		= trap_Cvar_VariableValue( "cg_forcemodel" ) != 0;
ADDRGP4 $153
ARGP4
ADDRLP4 92
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 92
INDIRF4
CNSTF4 0
EQF4 $155
ADDRLP4 88
CNSTI4 1
ASGNI4
ADDRGP4 $156
JUMPV
LABELV $155
ADDRLP4 88
CNSTI4 0
ASGNI4
LABELV $156
ADDRGP4 s_preferences+1564+60
ADDRLP4 88
INDIRI4
ASGNI4
line 127
;127:	s_preferences.drawteamoverlay.curvalue	= Com_Clamp( 0, 3, trap_Cvar_VariableValue( "cg_drawTeamOverlay" ) );
ADDRGP4 $159
ARGP4
ADDRLP4 96
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1077936128
ARGF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 100
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_preferences+1628+64
ADDRLP4 100
INDIRF4
CVFI4 4
ASGNI4
line 128
;128:	s_preferences.allowdownload.curvalue	= trap_Cvar_VariableValue( "cl_allowDownload" ) != 0;
ADDRGP4 $162
ARGP4
ADDRLP4 108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 108
INDIRF4
CNSTF4 0
EQF4 $164
ADDRLP4 104
CNSTI4 1
ASGNI4
ADDRGP4 $165
JUMPV
LABELV $164
ADDRLP4 104
CNSTI4 0
ASGNI4
LABELV $165
ADDRGP4 s_preferences+1788+60
ADDRLP4 104
INDIRI4
ASGNI4
line 129
;129:        s_preferences.delaghitscan.curvalue	= trap_Cvar_VariableValue( "cg_delag" ) != 0;
ADDRGP4 $168
ARGP4
ADDRLP4 116
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 116
INDIRF4
CNSTF4 0
EQF4 $170
ADDRLP4 112
CNSTI4 1
ASGNI4
ADDRGP4 $171
JUMPV
LABELV $170
ADDRLP4 112
CNSTI4 0
ASGNI4
LABELV $171
ADDRGP4 s_preferences+1724+60
ADDRLP4 112
INDIRI4
ASGNI4
line 130
;130:        s_preferences.chatbeep.curvalue         = trap_Cvar_VariableValue( "cg_chatBeep" ) != 0;
ADDRGP4 $174
ARGP4
ADDRLP4 124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 124
INDIRF4
CNSTF4 0
EQF4 $176
ADDRLP4 120
CNSTI4 1
ASGNI4
ADDRGP4 $177
JUMPV
LABELV $176
ADDRLP4 120
CNSTI4 0
ASGNI4
LABELV $177
ADDRGP4 s_preferences+1852+60
ADDRLP4 120
INDIRI4
ASGNI4
line 131
;131:        s_preferences.teamchatbeep.curvalue     = trap_Cvar_VariableValue( "cg_teamChatBeep" ) != 0;
ADDRGP4 $180
ARGP4
ADDRLP4 132
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 132
INDIRF4
CNSTF4 0
EQF4 $182
ADDRLP4 128
CNSTI4 1
ASGNI4
ADDRGP4 $183
JUMPV
LABELV $182
ADDRLP4 128
CNSTI4 0
ASGNI4
LABELV $183
ADDRGP4 s_preferences+1916+60
ADDRLP4 128
INDIRI4
ASGNI4
line 132
;132:}
LABELV $84
endproc Preferences_SetMenuItems 136 12
proc Preferences_Event 24 8
line 134
;133:
;134:static void Preferences_Event( void* ptr, int notification ) {
line 135
;135:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $185
line 136
;136:		return;
ADDRGP4 $184
JUMPV
LABELV $185
line 139
;137:	}
;138:
;139:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 127
LTI4 $187
ADDRLP4 0
INDIRI4
CNSTI4 146
GTI4 $187
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $287-508
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $287
address $190
address $233
address $239
address $245
address $250
address $253
address $256
address $259
address $262
address $265
address $268
address $286
address $236
address $274
address $224
address $227
address $230
address $205
address $280
address $283
code
LABELV $190
line 141
;140:	case ID_CROSSHAIR:
;141:		s_preferences.crosshair.curvalue++;
ADDRLP4 8
ADDRGP4 s_preferences+664+64
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 142
;142:		if( s_preferences.crosshair.curvalue == NUM_CROSSHAIRS || s_preferences.crosshairShader[s_preferences.crosshair.curvalue]==0 ) {
ADDRGP4 s_preferences+664+64
INDIRI4
CNSTI4 99
EQI4 $200
ADDRGP4 s_preferences+664+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_preferences+2068
ADDP4
INDIRI4
CNSTI4 0
NEI4 $193
LABELV $200
line 143
;143:			s_preferences.crosshair.curvalue = 0;
ADDRGP4 s_preferences+664+64
CNSTI4 0
ASGNI4
line 144
;144:		}
LABELV $193
line 145
;145:		trap_Cvar_SetValue( "cg_drawCrosshair", s_preferences.crosshair.curvalue );
ADDRGP4 $87
ARGP4
ADDRGP4 s_preferences+664+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 146
;146:		break;
ADDRGP4 $188
JUMPV
LABELV $205
line 149
;147:
;148:        case ID_CROSSHAIRHEALTH:
;149:                trap_Cvar_SetValue( "cg_crosshairHealth", s_preferences.crosshairHealth.curvalue );
ADDRGP4 $90
ARGP4
ADDRGP4 s_preferences+760+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 150
;150:                if(s_preferences.crosshairHealth.curvalue) {
ADDRGP4 s_preferences+760+60
INDIRI4
CNSTI4 0
EQI4 $208
line 152
;151:                    //If crosshairHealth is on: Don't allow color selection
;152:                    s_preferences.crosshairColorRed.generic.flags       |= QMF_INACTIVE;
ADDRLP4 12
ADDRGP4 s_preferences+824+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 153
;153:                    s_preferences.crosshairColorGreen.generic.flags     |= QMF_INACTIVE;
ADDRLP4 16
ADDRGP4 s_preferences+900+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 154
;154:                    s_preferences.crosshairColorBlue.generic.flags      |= QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 s_preferences+976+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 155
;155:                } else {
ADDRGP4 $188
JUMPV
LABELV $208
line 157
;156:                    //If crosshairHealth is off: Allow color selection
;157:                    s_preferences.crosshairColorRed.generic.flags       &= ~QMF_INACTIVE;
ADDRLP4 12
ADDRGP4 s_preferences+824+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 158
;158:                    s_preferences.crosshairColorGreen.generic.flags     &= ~QMF_INACTIVE;
ADDRLP4 16
ADDRGP4 s_preferences+900+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 159
;159:                    s_preferences.crosshairColorBlue.generic.flags      &= ~QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 s_preferences+976+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 160
;160:                }
line 161
;161:                break;
ADDRGP4 $188
JUMPV
LABELV $224
line 164
;162:
;163:        case ID_COLORRED:
;164:                trap_Cvar_SetValue( "cg_crosshairColorRed", ((float)s_preferences.crosshairColorRed.curvalue)/255.f );
ADDRGP4 $96
ARGP4
ADDRGP4 s_preferences+824+68
INDIRF4
CNSTF4 1132396544
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 165
;165:                break;
ADDRGP4 $188
JUMPV
LABELV $227
line 168
;166:
;167:        case ID_COLORGREEN:
;168:                trap_Cvar_SetValue( "cg_crosshairColorGreen", ((float)s_preferences.crosshairColorGreen.curvalue)/255.f );
ADDRGP4 $99
ARGP4
ADDRGP4 s_preferences+900+68
INDIRF4
CNSTF4 1132396544
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 169
;169:                break;
ADDRGP4 $188
JUMPV
LABELV $230
line 172
;170:
;171:        case ID_COLORBLUE:
;172:                trap_Cvar_SetValue( "cg_crosshairColorBlue", ((float)s_preferences.crosshairColorBlue.curvalue)/255.f );
ADDRGP4 $102
ARGP4
ADDRGP4 s_preferences+976+68
INDIRF4
CNSTF4 1132396544
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 173
;173:                break;
ADDRGP4 $188
JUMPV
LABELV $233
line 176
;174:
;175:	case ID_SIMPLEITEMS:
;176:		trap_Cvar_SetValue( "cg_simpleItems", s_preferences.simpleitems.curvalue );
ADDRGP4 $105
ARGP4
ADDRGP4 s_preferences+1052+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 177
;177:		break;
ADDRGP4 $188
JUMPV
LABELV $236
line 180
;178:                
;179:        case ID_WEAPONBAR:
;180:		trap_Cvar_SetValue( "cg_alwaysWeaponBar", s_preferences.alwaysweaponbar.curvalue );
ADDRGP4 $111
ARGP4
ADDRGP4 s_preferences+1116+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 181
;181:		break;
ADDRGP4 $188
JUMPV
LABELV $239
line 184
;182:
;183:	case ID_HIGHQUALITYSKY:
;184:		trap_Cvar_SetValue( "r_fastsky", !s_preferences.highqualitysky.curvalue );
ADDRGP4 $141
ARGP4
ADDRGP4 s_preferences+1436+60
INDIRI4
CNSTI4 0
NEI4 $243
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $244
JUMPV
LABELV $243
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $244
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 185
;185:		break;
ADDRGP4 $188
JUMPV
LABELV $245
line 188
;186:
;187:	case ID_EJECTINGBRASS:
;188:		if ( s_preferences.brass.curvalue )
ADDRGP4 s_preferences+1180+60
INDIRI4
CNSTI4 0
EQI4 $246
line 189
;189:			trap_Cvar_Reset( "cg_brassTime" );
ADDRGP4 $117
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
ADDRGP4 $188
JUMPV
LABELV $246
line 191
;190:		else
;191:			trap_Cvar_SetValue( "cg_brassTime", 0 );
ADDRGP4 $117
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 192
;192:		break;
ADDRGP4 $188
JUMPV
LABELV $250
line 195
;193:
;194:	case ID_WALLMARKS:
;195:		trap_Cvar_SetValue( "cg_marks", s_preferences.wallmarks.curvalue );
ADDRGP4 $123
ARGP4
ADDRGP4 s_preferences+1244+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 196
;196:		break;
ADDRGP4 $188
JUMPV
LABELV $253
line 199
;197:
;198:	case ID_DYNAMICLIGHTS:
;199:		trap_Cvar_SetValue( "r_dynamiclight", s_preferences.dynamiclights.curvalue );
ADDRGP4 $135
ARGP4
ADDRGP4 s_preferences+1308+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 200
;200:		break;		
ADDRGP4 $188
JUMPV
LABELV $256
line 203
;201:
;202:	case ID_IDENTIFYTARGET:
;203:		trap_Cvar_SetValue( "cg_drawCrosshairNames", s_preferences.identifytarget.curvalue );
ADDRGP4 $129
ARGP4
ADDRGP4 s_preferences+1372+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 204
;204:		break;
ADDRGP4 $188
JUMPV
LABELV $259
line 207
;205:
;206:	case ID_SYNCEVERYFRAME:
;207:		trap_Cvar_SetValue( "r_finish", s_preferences.synceveryframe.curvalue );
ADDRGP4 $147
ARGP4
ADDRGP4 s_preferences+1500+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 208
;208:		break;
ADDRGP4 $188
JUMPV
LABELV $262
line 211
;209:
;210:	case ID_FORCEMODEL:
;211:		trap_Cvar_SetValue( "cg_forcemodel", s_preferences.forcemodel.curvalue );
ADDRGP4 $153
ARGP4
ADDRGP4 s_preferences+1564+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 212
;212:		break;
ADDRGP4 $188
JUMPV
LABELV $265
line 215
;213:
;214:	case ID_DRAWTEAMOVERLAY:
;215:		trap_Cvar_SetValue( "cg_drawTeamOverlay", s_preferences.drawteamoverlay.curvalue );
ADDRGP4 $159
ARGP4
ADDRGP4 s_preferences+1628+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 216
;216:		break;
ADDRGP4 $188
JUMPV
LABELV $268
line 219
;217:
;218:	case ID_ALLOWDOWNLOAD:
;219:		trap_Cvar_SetValue( "cl_allowDownload", s_preferences.allowdownload.curvalue );
ADDRGP4 $162
ARGP4
ADDRGP4 s_preferences+1788+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 220
;220:		trap_Cvar_SetValue( "sv_allowDownload", s_preferences.allowdownload.curvalue );
ADDRGP4 $271
ARGP4
ADDRGP4 s_preferences+1788+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 221
;221:		break;
ADDRGP4 $188
JUMPV
LABELV $274
line 224
;222:               
;223:        case ID_DELAGHITSCAN:
;224:                trap_Cvar_SetValue( "g_delagHitscan", s_preferences.delaghitscan.curvalue );
ADDRGP4 $275
ARGP4
ADDRGP4 s_preferences+1724+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 225
;225:		trap_Cvar_SetValue( "cg_delag", s_preferences.delaghitscan.curvalue );
ADDRGP4 $168
ARGP4
ADDRGP4 s_preferences+1724+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 226
;226:		break;
ADDRGP4 $188
JUMPV
LABELV $280
line 229
;227:                
;228:        case ID_CHATBEEP:
;229:                trap_Cvar_SetValue( "cg_chatBeep", s_preferences.chatbeep.curvalue );
ADDRGP4 $174
ARGP4
ADDRGP4 s_preferences+1852+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 230
;230:                break;
ADDRGP4 $188
JUMPV
LABELV $283
line 233
;231:                
;232:        case ID_TEAMCHATBEEP:
;233:                trap_Cvar_SetValue( "cg_teamChatBeep", s_preferences.teamchatbeep.curvalue );
ADDRGP4 $180
ARGP4
ADDRGP4 s_preferences+1916+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 234
;234:                break;
ADDRGP4 $188
JUMPV
LABELV $286
line 237
;235:
;236:	case ID_BACK:
;237:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 238
;238:		break;
LABELV $187
LABELV $188
line 240
;239:	}
;240:}
LABELV $184
endproc Preferences_Event 24 8
proc Crosshair_Draw 64 20
line 248
;241:
;242:
;243:/*
;244:=================
;245:Crosshair_Draw
;246:=================
;247:*/
;248:static void Crosshair_Draw( void *self ) {
line 256
;249:	menulist_s	*s;
;250:	float		*color;
;251:	int			x, y;
;252:	int			style;
;253:	qboolean	focus;
;254:        vec4_t          color4;
;255:
;256:	s = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 257
;257:	x = s->generic.x;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 258
;258:	y =	s->generic.y;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 260
;259:
;260:	style = UI_SMALLFONT;
ADDRLP4 36
CNSTI4 16
ASGNI4
line 261
;261:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $291
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRGP4 $292
JUMPV
LABELV $291
ADDRLP4 40
CNSTI4 0
ASGNI4
LABELV $292
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 263
;262:
;263:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $293
line 264
;264:		color = text_color_disabled;
ADDRLP4 28
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $294
JUMPV
LABELV $293
line 265
;265:	else if ( focus )
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $295
line 266
;266:	{
line 267
;267:		color = text_color_highlight;
ADDRLP4 28
ADDRGP4 text_color_highlight
ASGNP4
line 268
;268:		style |= UI_PULSE;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 269
;269:	}
ADDRGP4 $296
JUMPV
LABELV $295
line 270
;270:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $297
line 271
;271:	{
line 272
;272:		color = text_color_highlight;
ADDRLP4 28
ADDRGP4 text_color_highlight
ASGNP4
line 273
;273:		style |= UI_BLINK;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 274
;274:	}
ADDRGP4 $298
JUMPV
LABELV $297
line 276
;275:	else
;276:		color = text_color_normal;
ADDRLP4 28
ADDRGP4 text_color_normal
ASGNP4
LABELV $298
LABELV $296
LABELV $294
line 278
;277:
;278:	if ( focus )
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $299
line 279
;279:	{
line 281
;280:		// draw cursor
;281:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
SUBI4
ADDRLP4 60
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
SUBI4
ADDRLP4 60
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 282
;282:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 283
;283:	}
LABELV $299
line 285
;284:
;285:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, style|UI_RIGHT, color );
ADDRLP4 20
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 286
;286:	if( !s->curvalue ) {
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 0
NEI4 $301
line 287
;287:		return;
ADDRGP4 $289
JUMPV
LABELV $301
line 289
;288:	}
;289:        color4[0]=((float)s_preferences.crosshairColorRed.curvalue)/255.f;
ADDRLP4 4
ADDRGP4 s_preferences+824+68
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 290
;290:        color4[1]=((float)s_preferences.crosshairColorGreen.curvalue)/255.f;
ADDRLP4 4+4
ADDRGP4 s_preferences+900+68
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 291
;291:        color4[2]=((float)s_preferences.crosshairColorBlue.curvalue)/255.f;
ADDRLP4 4+8
ADDRGP4 s_preferences+976+68
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 292
;292:        color4[3]=1.0f;
ADDRLP4 4+12
CNSTF4 1065353216
ASGNF4
line 293
;293:	trap_R_SetColor( color4 );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 294
;294:	UI_DrawHandlePic( x + SMALLCHAR_WIDTH, y - 4, 24, 24, s_preferences.crosshairShader[s->curvalue] );
ADDRLP4 20
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 48
CNSTF4 1103101952
ASGNF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_preferences+2068
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 295
;295:}
LABELV $289
endproc Crosshair_Draw 64 20
proc Preferences_MenuInit 20 12
line 298
;296:
;297:
;298:static void Preferences_MenuInit( void ) {
line 301
;299:	int				y;
;300:        
;301:        UI_SetDefaultCvar("cg_crosshairHealth","1");
ADDRGP4 $90
ARGP4
ADDRGP4 $314
ARGP4
ADDRGP4 UI_SetDefaultCvar
CALLV
pop
line 302
;302:        UI_SetDefaultCvar("cg_crosshairColorRed","1");
ADDRGP4 $96
ARGP4
ADDRGP4 $314
ARGP4
ADDRGP4 UI_SetDefaultCvar
CALLV
pop
line 303
;303:        UI_SetDefaultCvar("cg_crosshairColorBlue","1");
ADDRGP4 $102
ARGP4
ADDRGP4 $314
ARGP4
ADDRGP4 UI_SetDefaultCvar
CALLV
pop
line 304
;304:        UI_SetDefaultCvar("cg_crosshairColorGreen","1");
ADDRGP4 $99
ARGP4
ADDRGP4 $314
ARGP4
ADDRGP4 UI_SetDefaultCvar
CALLV
pop
line 306
;305:        
;306:	memset( &s_preferences, 0 ,sizeof(preferences_t) );
ADDRGP4 s_preferences
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2464
ARGI4
ADDRGP4 memset
CALLP4
pop
line 308
;307:
;308:	Preferences_Cache();
ADDRGP4 Preferences_Cache
CALLV
pop
line 310
;309:
;310:	s_preferences.menu.wrapAround = qtrue;
ADDRGP4 s_preferences+404
CNSTI4 1
ASGNI4
line 311
;311:	s_preferences.menu.fullscreen = qtrue;
ADDRGP4 s_preferences+408
CNSTI4 1
ASGNI4
line 313
;312:
;313:	s_preferences.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_preferences+416
CNSTI4 10
ASGNI4
line 314
;314:	s_preferences.banner.generic.x	   = 320;
ADDRGP4 s_preferences+416+12
CNSTI4 320
ASGNI4
line 315
;315:	s_preferences.banner.generic.y	   = 16;
ADDRGP4 s_preferences+416+16
CNSTI4 16
ASGNI4
line 316
;316:	s_preferences.banner.string		   = "GAME OPTIONS";
ADDRGP4 s_preferences+416+60
ADDRGP4 $324
ASGNP4
line 317
;317:	s_preferences.banner.color         = color_white;
ADDRGP4 s_preferences+416+68
ADDRGP4 color_white
ASGNP4
line 318
;318:	s_preferences.banner.style         = UI_CENTER;
ADDRGP4 s_preferences+416+64
CNSTI4 1
ASGNI4
line 320
;319:
;320:	s_preferences.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_preferences+488
CNSTI4 6
ASGNI4
line 321
;321:	s_preferences.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_preferences+488+4
ADDRGP4 $332
ASGNP4
line 322
;322:	s_preferences.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_preferences+488+44
CNSTU4 16384
ASGNU4
line 323
;323:	s_preferences.framel.generic.x	   = 0;
ADDRGP4 s_preferences+488+12
CNSTI4 0
ASGNI4
line 324
;324:	s_preferences.framel.generic.y	   = 78;
ADDRGP4 s_preferences+488+16
CNSTI4 78
ASGNI4
line 325
;325:	s_preferences.framel.width  	   = 256;
ADDRGP4 s_preferences+488+76
CNSTI4 256
ASGNI4
line 326
;326:	s_preferences.framel.height  	   = 329;
ADDRGP4 s_preferences+488+80
CNSTI4 329
ASGNI4
line 328
;327:
;328:	s_preferences.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_preferences+576
CNSTI4 6
ASGNI4
line 329
;329:	s_preferences.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_preferences+576+4
ADDRGP4 $346
ASGNP4
line 330
;330:	s_preferences.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_preferences+576+44
CNSTU4 16384
ASGNU4
line 331
;331:	s_preferences.framer.generic.x	   = 376;
ADDRGP4 s_preferences+576+12
CNSTI4 376
ASGNI4
line 332
;332:	s_preferences.framer.generic.y	   = 76;
ADDRGP4 s_preferences+576+16
CNSTI4 76
ASGNI4
line 333
;333:	s_preferences.framer.width  	   = 256;
ADDRGP4 s_preferences+576+76
CNSTI4 256
ASGNI4
line 334
;334:	s_preferences.framer.height  	   = 334;
ADDRGP4 s_preferences+576+80
CNSTI4 334
ASGNI4
line 336
;335:
;336:	y = 82;
ADDRLP4 0
CNSTI4 82
ASGNI4
line 337
;337:	s_preferences.crosshair.generic.type		= MTYPE_TEXT;
ADDRGP4 s_preferences+664
CNSTI4 7
ASGNI4
line 338
;338:	s_preferences.crosshair.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT|QMF_OWNERDRAW;
ADDRGP4 s_preferences+664+44
CNSTU4 98562
ASGNU4
line 339
;339:	s_preferences.crosshair.generic.x			= PREFERENCES_X_POS;
ADDRGP4 s_preferences+664+12
CNSTI4 360
ASGNI4
line 340
;340:	s_preferences.crosshair.generic.y			= y;
ADDRGP4 s_preferences+664+16
ADDRLP4 0
INDIRI4
ASGNI4
line 341
;341:	s_preferences.crosshair.generic.name		= "Crosshair:";
ADDRGP4 s_preferences+664+4
ADDRGP4 $366
ASGNP4
line 342
;342:	s_preferences.crosshair.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+664+48
ADDRGP4 Preferences_Event
ASGNP4
line 343
;343:	s_preferences.crosshair.generic.ownerdraw	= Crosshair_Draw;
ADDRGP4 s_preferences+664+56
ADDRGP4 Crosshair_Draw
ASGNP4
line 344
;344:	s_preferences.crosshair.generic.id			= ID_CROSSHAIR;
ADDRGP4 s_preferences+664+8
CNSTI4 127
ASGNI4
line 345
;345:	s_preferences.crosshair.generic.top			= y - 4;
ADDRGP4 s_preferences+664+24
ADDRLP4 0
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 346
;346:	s_preferences.crosshair.generic.bottom		= y + 20;
ADDRGP4 s_preferences+664+32
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 347
;347:	s_preferences.crosshair.generic.left		= PREFERENCES_X_POS - ( ( strlen(s_preferences.crosshair.generic.name) + 1 ) * SMALLCHAR_WIDTH );
ADDRGP4 s_preferences+664+4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 s_preferences+664+20
CNSTI4 360
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 8
ADDI4
SUBI4
ASGNI4
line 348
;348:	s_preferences.crosshair.generic.right		= PREFERENCES_X_POS + 48;
ADDRGP4 s_preferences+664+28
CNSTI4 408
ASGNI4
line 350
;349:
;350:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 351
;351:	s_preferences.crosshairHealth.generic.type        = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+760
CNSTI4 5
ASGNI4
line 352
;352:	s_preferences.crosshairHealth.generic.name	      = "Crosshair shows health:";
ADDRGP4 s_preferences+760+4
ADDRGP4 $386
ASGNP4
line 353
;353:	s_preferences.crosshairHealth.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+760+44
CNSTU4 258
ASGNU4
line 354
;354:	s_preferences.crosshairHealth.generic.callback    = Preferences_Event;
ADDRGP4 s_preferences+760+48
ADDRGP4 Preferences_Event
ASGNP4
line 355
;355:	s_preferences.crosshairHealth.generic.id          = ID_CROSSHAIRHEALTH;
ADDRGP4 s_preferences+760+8
CNSTI4 144
ASGNI4
line 356
;356:	s_preferences.crosshairHealth.generic.x	          = PREFERENCES_X_POS;
ADDRGP4 s_preferences+760+12
CNSTI4 360
ASGNI4
line 357
;357:	s_preferences.crosshairHealth.generic.y	          = y;
ADDRGP4 s_preferences+760+16
ADDRLP4 0
INDIRI4
ASGNI4
line 359
;358:
;359:        y += BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 360
;360:        s_preferences.crosshairColorRed.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_preferences+824
CNSTI4 1
ASGNI4
line 361
;361:	s_preferences.crosshairColorRed.generic.name		= "Crosshair red:";
ADDRGP4 s_preferences+824+4
ADDRGP4 $400
ASGNP4
line 362
;362:	s_preferences.crosshairColorRed.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+824+44
CNSTU4 258
ASGNU4
line 363
;363:	s_preferences.crosshairColorRed.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+824+48
ADDRGP4 Preferences_Event
ASGNP4
line 364
;364:	s_preferences.crosshairColorRed.generic.id		= ID_COLORRED;
ADDRGP4 s_preferences+824+8
CNSTI4 141
ASGNI4
line 365
;365:	s_preferences.crosshairColorRed.generic.x			= PREFERENCES_X_POS;
ADDRGP4 s_preferences+824+12
CNSTI4 360
ASGNI4
line 366
;366:	s_preferences.crosshairColorRed.generic.y			= y;
ADDRGP4 s_preferences+824+16
ADDRLP4 0
INDIRI4
ASGNI4
line 367
;367:	s_preferences.crosshairColorRed.minvalue			= 0.0f;
ADDRGP4 s_preferences+824+60
CNSTF4 0
ASGNF4
line 368
;368:	s_preferences.crosshairColorRed.maxvalue			= 255.0f;
ADDRGP4 s_preferences+824+64
CNSTF4 1132396544
ASGNF4
line 370
;369:
;370:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 371
;371:        s_preferences.crosshairColorGreen.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_preferences+900
CNSTI4 1
ASGNI4
line 372
;372:	s_preferences.crosshairColorGreen.generic.name		= "Crosshair green:";
ADDRGP4 s_preferences+900+4
ADDRGP4 $418
ASGNP4
line 373
;373:	s_preferences.crosshairColorGreen.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+900+44
CNSTU4 258
ASGNU4
line 374
;374:	s_preferences.crosshairColorGreen.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+900+48
ADDRGP4 Preferences_Event
ASGNP4
line 375
;375:	s_preferences.crosshairColorGreen.generic.id		= ID_COLORGREEN;
ADDRGP4 s_preferences+900+8
CNSTI4 142
ASGNI4
line 376
;376:	s_preferences.crosshairColorGreen.generic.x			= PREFERENCES_X_POS;
ADDRGP4 s_preferences+900+12
CNSTI4 360
ASGNI4
line 377
;377:	s_preferences.crosshairColorGreen.generic.y			= y;
ADDRGP4 s_preferences+900+16
ADDRLP4 0
INDIRI4
ASGNI4
line 378
;378:	s_preferences.crosshairColorGreen.minvalue			= 0.0f;
ADDRGP4 s_preferences+900+60
CNSTF4 0
ASGNF4
line 379
;379:	s_preferences.crosshairColorGreen.maxvalue			= 255.0f;
ADDRGP4 s_preferences+900+64
CNSTF4 1132396544
ASGNF4
line 381
;380:
;381:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 382
;382:        s_preferences.crosshairColorBlue.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_preferences+976
CNSTI4 1
ASGNI4
line 383
;383:	s_preferences.crosshairColorBlue.generic.name		= "Crosshair blue:";
ADDRGP4 s_preferences+976+4
ADDRGP4 $436
ASGNP4
line 384
;384:	s_preferences.crosshairColorBlue.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+976+44
CNSTU4 258
ASGNU4
line 385
;385:	s_preferences.crosshairColorBlue.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+976+48
ADDRGP4 Preferences_Event
ASGNP4
line 386
;386:	s_preferences.crosshairColorBlue.generic.id		= ID_COLORBLUE;
ADDRGP4 s_preferences+976+8
CNSTI4 143
ASGNI4
line 387
;387:	s_preferences.crosshairColorBlue.generic.x			= PREFERENCES_X_POS;
ADDRGP4 s_preferences+976+12
CNSTI4 360
ASGNI4
line 388
;388:	s_preferences.crosshairColorBlue.generic.y			= y;
ADDRGP4 s_preferences+976+16
ADDRLP4 0
INDIRI4
ASGNI4
line 389
;389:	s_preferences.crosshairColorBlue.minvalue			= 0.0f;
ADDRGP4 s_preferences+976+60
CNSTF4 0
ASGNF4
line 390
;390:	s_preferences.crosshairColorBlue.maxvalue			= 255.0f;
ADDRGP4 s_preferences+976+64
CNSTF4 1132396544
ASGNF4
line 393
;391:
;392:
;393:        if(s_preferences.crosshairHealth.curvalue) {
ADDRGP4 s_preferences+760+60
INDIRI4
CNSTI4 0
EQI4 $451
line 394
;394:            s_preferences.crosshairColorRed.generic.flags       |= QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_preferences+824+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 395
;395:            s_preferences.crosshairColorGreen.generic.flags       |= QMF_INACTIVE;
ADDRLP4 12
ADDRGP4 s_preferences+900+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 396
;396:            s_preferences.crosshairColorBlue.generic.flags       |= QMF_INACTIVE;
ADDRLP4 16
ADDRGP4 s_preferences+976+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 397
;397:        }
LABELV $451
line 399
;398:
;399:	y += BIGCHAR_HEIGHT+2+4;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 400
;400:	s_preferences.simpleitems.generic.type        = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1052
CNSTI4 5
ASGNI4
line 401
;401:	s_preferences.simpleitems.generic.name	      = "Simple Items:";
ADDRGP4 s_preferences+1052+4
ADDRGP4 $464
ASGNP4
line 402
;402:	s_preferences.simpleitems.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1052+44
CNSTU4 258
ASGNU4
line 403
;403:	s_preferences.simpleitems.generic.callback    = Preferences_Event;
ADDRGP4 s_preferences+1052+48
ADDRGP4 Preferences_Event
ASGNP4
line 404
;404:	s_preferences.simpleitems.generic.id          = ID_SIMPLEITEMS;
ADDRGP4 s_preferences+1052+8
CNSTI4 128
ASGNI4
line 405
;405:	s_preferences.simpleitems.generic.x	          = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1052+12
CNSTI4 360
ASGNI4
line 406
;406:	s_preferences.simpleitems.generic.y	          = y;
ADDRGP4 s_preferences+1052+16
ADDRLP4 0
INDIRI4
ASGNI4
line 409
;407:        
;408:        //Elimination
;409:        y += BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 410
;410:	s_preferences.alwaysweaponbar.generic.type        = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1116
CNSTI4 5
ASGNI4
line 411
;411:	s_preferences.alwaysweaponbar.generic.name	      = "Always show weapons:";
ADDRGP4 s_preferences+1116+4
ADDRGP4 $478
ASGNP4
line 412
;412:	s_preferences.alwaysweaponbar.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1116+44
CNSTU4 258
ASGNU4
line 413
;413:	s_preferences.alwaysweaponbar.generic.callback    = Preferences_Event;
ADDRGP4 s_preferences+1116+48
ADDRGP4 Preferences_Event
ASGNP4
line 414
;414:	s_preferences.alwaysweaponbar.generic.id          = ID_WEAPONBAR;
ADDRGP4 s_preferences+1116+8
CNSTI4 139
ASGNI4
line 415
;415:	s_preferences.alwaysweaponbar.generic.x	          = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1116+12
CNSTI4 360
ASGNI4
line 416
;416:	s_preferences.alwaysweaponbar.generic.y	          = y;
ADDRGP4 s_preferences+1116+16
ADDRLP4 0
INDIRI4
ASGNI4
line 418
;417:
;418:	y += BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 419
;419:	s_preferences.wallmarks.generic.type          = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1244
CNSTI4 5
ASGNI4
line 420
;420:	s_preferences.wallmarks.generic.name	      = "Marks on Walls:";
ADDRGP4 s_preferences+1244+4
ADDRGP4 $492
ASGNP4
line 421
;421:	s_preferences.wallmarks.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1244+44
CNSTU4 258
ASGNU4
line 422
;422:	s_preferences.wallmarks.generic.callback      = Preferences_Event;
ADDRGP4 s_preferences+1244+48
ADDRGP4 Preferences_Event
ASGNP4
line 423
;423:	s_preferences.wallmarks.generic.id            = ID_WALLMARKS;
ADDRGP4 s_preferences+1244+8
CNSTI4 131
ASGNI4
line 424
;424:	s_preferences.wallmarks.generic.x	          = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1244+12
CNSTI4 360
ASGNI4
line 425
;425:	s_preferences.wallmarks.generic.y	          = y;
ADDRGP4 s_preferences+1244+16
ADDRLP4 0
INDIRI4
ASGNI4
line 427
;426:
;427:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 428
;428:	s_preferences.brass.generic.type              = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1180
CNSTI4 5
ASGNI4
line 429
;429:	s_preferences.brass.generic.name	          = "Ejecting Brass:";
ADDRGP4 s_preferences+1180+4
ADDRGP4 $506
ASGNP4
line 430
;430:	s_preferences.brass.generic.flags	          = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1180+44
CNSTU4 258
ASGNU4
line 431
;431:	s_preferences.brass.generic.callback          = Preferences_Event;
ADDRGP4 s_preferences+1180+48
ADDRGP4 Preferences_Event
ASGNP4
line 432
;432:	s_preferences.brass.generic.id                = ID_EJECTINGBRASS;
ADDRGP4 s_preferences+1180+8
CNSTI4 130
ASGNI4
line 433
;433:	s_preferences.brass.generic.x	              = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1180+12
CNSTI4 360
ASGNI4
line 434
;434:	s_preferences.brass.generic.y	              = y;
ADDRGP4 s_preferences+1180+16
ADDRLP4 0
INDIRI4
ASGNI4
line 436
;435:
;436:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 437
;437:	s_preferences.dynamiclights.generic.type      = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1308
CNSTI4 5
ASGNI4
line 438
;438:	s_preferences.dynamiclights.generic.name	  = "Dynamic Lights:";
ADDRGP4 s_preferences+1308+4
ADDRGP4 $520
ASGNP4
line 439
;439:	s_preferences.dynamiclights.generic.flags     = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1308+44
CNSTU4 258
ASGNU4
line 440
;440:	s_preferences.dynamiclights.generic.callback  = Preferences_Event;
ADDRGP4 s_preferences+1308+48
ADDRGP4 Preferences_Event
ASGNP4
line 441
;441:	s_preferences.dynamiclights.generic.id        = ID_DYNAMICLIGHTS;
ADDRGP4 s_preferences+1308+8
CNSTI4 132
ASGNI4
line 442
;442:	s_preferences.dynamiclights.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1308+12
CNSTI4 360
ASGNI4
line 443
;443:	s_preferences.dynamiclights.generic.y	      = y;
ADDRGP4 s_preferences+1308+16
ADDRLP4 0
INDIRI4
ASGNI4
line 445
;444:
;445:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 446
;446:	s_preferences.identifytarget.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1372
CNSTI4 5
ASGNI4
line 447
;447:	s_preferences.identifytarget.generic.name	  = "Identify Target:";
ADDRGP4 s_preferences+1372+4
ADDRGP4 $534
ASGNP4
line 448
;448:	s_preferences.identifytarget.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1372+44
CNSTU4 258
ASGNU4
line 449
;449:	s_preferences.identifytarget.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1372+48
ADDRGP4 Preferences_Event
ASGNP4
line 450
;450:	s_preferences.identifytarget.generic.id       = ID_IDENTIFYTARGET;
ADDRGP4 s_preferences+1372+8
CNSTI4 133
ASGNI4
line 451
;451:	s_preferences.identifytarget.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1372+12
CNSTI4 360
ASGNI4
line 452
;452:	s_preferences.identifytarget.generic.y	      = y;
ADDRGP4 s_preferences+1372+16
ADDRLP4 0
INDIRI4
ASGNI4
line 454
;453:
;454:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 455
;455:	s_preferences.highqualitysky.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1436
CNSTI4 5
ASGNI4
line 456
;456:	s_preferences.highqualitysky.generic.name	  = "High Quality Sky:";
ADDRGP4 s_preferences+1436+4
ADDRGP4 $548
ASGNP4
line 457
;457:	s_preferences.highqualitysky.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1436+44
CNSTU4 258
ASGNU4
line 458
;458:	s_preferences.highqualitysky.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1436+48
ADDRGP4 Preferences_Event
ASGNP4
line 459
;459:	s_preferences.highqualitysky.generic.id       = ID_HIGHQUALITYSKY;
ADDRGP4 s_preferences+1436+8
CNSTI4 129
ASGNI4
line 460
;460:	s_preferences.highqualitysky.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1436+12
CNSTI4 360
ASGNI4
line 461
;461:	s_preferences.highqualitysky.generic.y	      = y;
ADDRGP4 s_preferences+1436+16
ADDRLP4 0
INDIRI4
ASGNI4
line 463
;462:
;463:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 464
;464:	s_preferences.synceveryframe.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1500
CNSTI4 5
ASGNI4
line 465
;465:	s_preferences.synceveryframe.generic.name	  = "Sync Every Frame:";
ADDRGP4 s_preferences+1500+4
ADDRGP4 $562
ASGNP4
line 466
;466:	s_preferences.synceveryframe.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1500+44
CNSTU4 258
ASGNU4
line 467
;467:	s_preferences.synceveryframe.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1500+48
ADDRGP4 Preferences_Event
ASGNP4
line 468
;468:	s_preferences.synceveryframe.generic.id       = ID_SYNCEVERYFRAME;
ADDRGP4 s_preferences+1500+8
CNSTI4 134
ASGNI4
line 469
;469:	s_preferences.synceveryframe.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1500+12
CNSTI4 360
ASGNI4
line 470
;470:	s_preferences.synceveryframe.generic.y	      = y;
ADDRGP4 s_preferences+1500+16
ADDRLP4 0
INDIRI4
ASGNI4
line 472
;471:
;472:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 473
;473:	s_preferences.forcemodel.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1564
CNSTI4 5
ASGNI4
line 474
;474:	s_preferences.forcemodel.generic.name	  = "Force Player Models:";
ADDRGP4 s_preferences+1564+4
ADDRGP4 $576
ASGNP4
line 475
;475:	s_preferences.forcemodel.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1564+44
CNSTU4 258
ASGNU4
line 476
;476:	s_preferences.forcemodel.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1564+48
ADDRGP4 Preferences_Event
ASGNP4
line 477
;477:	s_preferences.forcemodel.generic.id       = ID_FORCEMODEL;
ADDRGP4 s_preferences+1564+8
CNSTI4 135
ASGNI4
line 478
;478:	s_preferences.forcemodel.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1564+12
CNSTI4 360
ASGNI4
line 479
;479:	s_preferences.forcemodel.generic.y	      = y;
ADDRGP4 s_preferences+1564+16
ADDRLP4 0
INDIRI4
ASGNI4
line 481
;480:
;481:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 482
;482:	s_preferences.drawteamoverlay.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_preferences+1628
CNSTI4 3
ASGNI4
line 483
;483:	s_preferences.drawteamoverlay.generic.name	   = "Draw Team Overlay:";
ADDRGP4 s_preferences+1628+4
ADDRGP4 $590
ASGNP4
line 484
;484:	s_preferences.drawteamoverlay.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1628+44
CNSTU4 258
ASGNU4
line 485
;485:	s_preferences.drawteamoverlay.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1628+48
ADDRGP4 Preferences_Event
ASGNP4
line 486
;486:	s_preferences.drawteamoverlay.generic.id       = ID_DRAWTEAMOVERLAY;
ADDRGP4 s_preferences+1628+8
CNSTI4 136
ASGNI4
line 487
;487:	s_preferences.drawteamoverlay.generic.x	       = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1628+12
CNSTI4 360
ASGNI4
line 488
;488:	s_preferences.drawteamoverlay.generic.y	       = y;
ADDRGP4 s_preferences+1628+16
ADDRLP4 0
INDIRI4
ASGNI4
line 489
;489:	s_preferences.drawteamoverlay.itemnames			= teamoverlay_names;
ADDRGP4 s_preferences+1628+76
ADDRGP4 teamoverlay_names
ASGNP4
line 491
;490:
;491:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 492
;492:	s_preferences.delaghitscan.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1724
CNSTI4 5
ASGNI4
line 493
;493:	s_preferences.delaghitscan.generic.name	   = "Unlag hitscan:";
ADDRGP4 s_preferences+1724+4
ADDRGP4 $606
ASGNP4
line 494
;494:	s_preferences.delaghitscan.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1724+44
CNSTU4 258
ASGNU4
line 495
;495:	s_preferences.delaghitscan.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1724+48
ADDRGP4 Preferences_Event
ASGNP4
line 496
;496:	s_preferences.delaghitscan.generic.id       = ID_DELAGHITSCAN;
ADDRGP4 s_preferences+1724+8
CNSTI4 140
ASGNI4
line 497
;497:	s_preferences.delaghitscan.generic.x	       = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1724+12
CNSTI4 360
ASGNI4
line 498
;498:	s_preferences.delaghitscan.generic.y	       = y;
ADDRGP4 s_preferences+1724+16
ADDRLP4 0
INDIRI4
ASGNI4
line 500
;499:        
;500:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 501
;501:	s_preferences.allowdownload.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1788
CNSTI4 5
ASGNI4
line 502
;502:	s_preferences.allowdownload.generic.name	   = "Automatic Downloading:";
ADDRGP4 s_preferences+1788+4
ADDRGP4 $620
ASGNP4
line 503
;503:	s_preferences.allowdownload.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1788+44
CNSTU4 258
ASGNU4
line 504
;504:	s_preferences.allowdownload.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1788+48
ADDRGP4 Preferences_Event
ASGNP4
line 505
;505:	s_preferences.allowdownload.generic.id       = ID_ALLOWDOWNLOAD;
ADDRGP4 s_preferences+1788+8
CNSTI4 137
ASGNI4
line 506
;506:	s_preferences.allowdownload.generic.x	       = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1788+12
CNSTI4 360
ASGNI4
line 507
;507:	s_preferences.allowdownload.generic.y	       = y;
ADDRGP4 s_preferences+1788+16
ADDRLP4 0
INDIRI4
ASGNI4
line 509
;508:        
;509:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 510
;510:	s_preferences.chatbeep.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1852
CNSTI4 5
ASGNI4
line 511
;511:	s_preferences.chatbeep.generic.name	   = "Beep on chat:";
ADDRGP4 s_preferences+1852+4
ADDRGP4 $634
ASGNP4
line 512
;512:	s_preferences.chatbeep.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1852+44
CNSTU4 258
ASGNU4
line 513
;513:	s_preferences.chatbeep.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1852+48
ADDRGP4 Preferences_Event
ASGNP4
line 514
;514:	s_preferences.chatbeep.generic.id       = ID_CHATBEEP;
ADDRGP4 s_preferences+1852+8
CNSTI4 145
ASGNI4
line 515
;515:	s_preferences.chatbeep.generic.x	       = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1852+12
CNSTI4 360
ASGNI4
line 516
;516:	s_preferences.chatbeep.generic.y	       = y;
ADDRGP4 s_preferences+1852+16
ADDRLP4 0
INDIRI4
ASGNI4
line 518
;517:        
;518:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 519
;519:	s_preferences.teamchatbeep.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1916
CNSTI4 5
ASGNI4
line 520
;520:	s_preferences.teamchatbeep.generic.name	   = "Beep on team chat:";
ADDRGP4 s_preferences+1916+4
ADDRGP4 $648
ASGNP4
line 521
;521:	s_preferences.teamchatbeep.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1916+44
CNSTU4 258
ASGNU4
line 522
;522:	s_preferences.teamchatbeep.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1916+48
ADDRGP4 Preferences_Event
ASGNP4
line 523
;523:	s_preferences.teamchatbeep.generic.id       = ID_TEAMCHATBEEP;
ADDRGP4 s_preferences+1916+8
CNSTI4 146
ASGNI4
line 524
;524:	s_preferences.teamchatbeep.generic.x	       = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1916+12
CNSTI4 360
ASGNI4
line 525
;525:	s_preferences.teamchatbeep.generic.y	       = y;
ADDRGP4 s_preferences+1916+16
ADDRLP4 0
INDIRI4
ASGNI4
line 527
;526:
;527:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 528
;528:	s_preferences.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_preferences+1980
CNSTI4 6
ASGNI4
line 529
;529:	s_preferences.back.generic.name     = ART_BACK0;
ADDRGP4 s_preferences+1980+4
ADDRGP4 $662
ASGNP4
line 530
;530:	s_preferences.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_preferences+1980+44
CNSTU4 260
ASGNU4
line 531
;531:	s_preferences.back.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1980+48
ADDRGP4 Preferences_Event
ASGNP4
line 532
;532:	s_preferences.back.generic.id	    = ID_BACK;
ADDRGP4 s_preferences+1980+8
CNSTI4 138
ASGNI4
line 533
;533:	s_preferences.back.generic.x		= 0;
ADDRGP4 s_preferences+1980+12
CNSTI4 0
ASGNI4
line 534
;534:	s_preferences.back.generic.y		= 480-64;
ADDRGP4 s_preferences+1980+16
CNSTI4 416
ASGNI4
line 535
;535:	s_preferences.back.width  		    = 128;
ADDRGP4 s_preferences+1980+76
CNSTI4 128
ASGNI4
line 536
;536:	s_preferences.back.height  		    = 64;
ADDRGP4 s_preferences+1980+80
CNSTI4 64
ASGNI4
line 537
;537:	s_preferences.back.focuspic         = ART_BACK1;
ADDRGP4 s_preferences+1980+60
ADDRGP4 $679
ASGNP4
line 539
;538:
;539:	Menu_AddItem( &s_preferences.menu, &s_preferences.banner );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 540
;540:	Menu_AddItem( &s_preferences.menu, &s_preferences.framel );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 541
;541:	Menu_AddItem( &s_preferences.menu, &s_preferences.framer );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 543
;542:
;543:	Menu_AddItem( &s_preferences.menu, &s_preferences.crosshair );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 544
;544:        Menu_AddItem( &s_preferences.menu, &s_preferences.crosshairHealth );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 545
;545:        Menu_AddItem( &s_preferences.menu, &s_preferences.crosshairColorRed );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 546
;546:        Menu_AddItem( &s_preferences.menu, &s_preferences.crosshairColorGreen );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+900
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 547
;547:        Menu_AddItem( &s_preferences.menu, &s_preferences.crosshairColorBlue );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+976
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 548
;548:	Menu_AddItem( &s_preferences.menu, &s_preferences.simpleitems );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1052
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 549
;549:        Menu_AddItem( &s_preferences.menu, &s_preferences.alwaysweaponbar );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1116
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 550
;550:	Menu_AddItem( &s_preferences.menu, &s_preferences.wallmarks );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1244
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 551
;551:	Menu_AddItem( &s_preferences.menu, &s_preferences.brass );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 552
;552:	Menu_AddItem( &s_preferences.menu, &s_preferences.dynamiclights );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1308
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 553
;553:	Menu_AddItem( &s_preferences.menu, &s_preferences.identifytarget );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1372
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 554
;554:	Menu_AddItem( &s_preferences.menu, &s_preferences.highqualitysky );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1436
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 555
;555:	Menu_AddItem( &s_preferences.menu, &s_preferences.synceveryframe );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1500
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 556
;556:	Menu_AddItem( &s_preferences.menu, &s_preferences.forcemodel );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1564
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 557
;557:	Menu_AddItem( &s_preferences.menu, &s_preferences.drawteamoverlay );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1628
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 558
;558:        Menu_AddItem( &s_preferences.menu, &s_preferences.delaghitscan );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 559
;559:	Menu_AddItem( &s_preferences.menu, &s_preferences.allowdownload );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1788
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 560
;560:        Menu_AddItem( &s_preferences.menu, &s_preferences.teamchatbeep );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1916
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 561
;561:        Menu_AddItem( &s_preferences.menu, &s_preferences.chatbeep );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1852
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 563
;562:
;563:	Menu_AddItem( &s_preferences.menu, &s_preferences.back );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1980
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 565
;564:
;565:	Preferences_SetMenuItems();
ADDRGP4 Preferences_SetMenuItems
CALLV
pop
line 566
;566:}
LABELV $313
endproc Preferences_MenuInit 20 12
export Preferences_Cache
proc Preferences_Cache 28 8
line 574
;567:
;568:
;569:/*
;570:===============
;571:Preferences_Cache
;572:===============
;573:*/
;574:void Preferences_Cache( void ) {
line 577
;575:	int		n;
;576:
;577:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $332
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 578
;578:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $346
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 579
;579:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $662
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 580
;580:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $679
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 581
;581:	for( n = 0; n < NUM_CROSSHAIRS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $704
line 582
;582:                if (n < 10)
ADDRLP4 0
INDIRI4
CNSTI4 10
GEI4 $708
line 583
;583:			s_preferences.crosshairShader[n] = trap_R_RegisterShaderNoMip( va("gfx/2d/crosshair%c", 'a' + n ) );
ADDRGP4 $711
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_preferences+2068
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $709
JUMPV
LABELV $708
line 585
;584:		else
;585:			s_preferences.crosshairShader[n] = trap_R_RegisterShaderNoMip( va("gfx/2d/crosshair%02d", n - 10) );
ADDRGP4 $713
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_preferences+2068
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
LABELV $709
line 587
;586:	
;587:	}
LABELV $705
line 581
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 99
LTI4 $704
line 588
;588:}
LABELV $703
endproc Preferences_Cache 28 8
export UI_PreferencesMenu
proc UI_PreferencesMenu 0 4
line 596
;589:
;590:
;591:/*
;592:===============
;593:UI_PreferencesMenu
;594:===============
;595:*/
;596:void UI_PreferencesMenu( void ) {
line 597
;597:	Preferences_MenuInit();
ADDRGP4 Preferences_MenuInit
CALLV
pop
line 598
;598:	UI_PushMenu( &s_preferences.menu );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 599
;599:}
LABELV $714
endproc UI_PreferencesMenu 0 4
bss
align 4
LABELV s_preferences
skip 2464
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
import UI_SpecifyPasswordMenu
import SpecifyPassword_Cache
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
LABELV $713
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 0
align 1
LABELV $711
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $679
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
LABELV $662
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
LABELV $648
byte 1 66
byte 1 101
byte 1 101
byte 1 112
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $634
byte 1 66
byte 1 101
byte 1 101
byte 1 112
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $620
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $606
byte 1 85
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 99
byte 1 97
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $590
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $576
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $562
byte 1 83
byte 1 121
byte 1 110
byte 1 99
byte 1 32
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $548
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 83
byte 1 107
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $534
byte 1 73
byte 1 100
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $520
byte 1 68
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 32
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $506
byte 1 69
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 66
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $492
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 87
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $478
byte 1 65
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $464
byte 1 83
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $436
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $418
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $400
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $386
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 115
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 0
align 1
LABELV $366
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $346
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
LABELV $332
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
align 1
LABELV $324
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 32
byte 1 79
byte 1 80
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $314
byte 1 49
byte 1 0
align 1
LABELV $275
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 103
byte 1 72
byte 1 105
byte 1 116
byte 1 115
byte 1 99
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $271
byte 1 115
byte 1 118
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $180
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 66
byte 1 101
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $174
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 66
byte 1 101
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $168
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $162
byte 1 99
byte 1 108
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $159
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $153
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $147
byte 1 114
byte 1 95
byte 1 102
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $141
byte 1 114
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 115
byte 1 107
byte 1 121
byte 1 0
align 1
LABELV $135
byte 1 114
byte 1 95
byte 1 100
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $129
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $111
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 66
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $102
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $99
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 71
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $96
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $90
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $87
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $83
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $82
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $81
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $80
byte 1 111
byte 1 102
byte 1 102
byte 1 0

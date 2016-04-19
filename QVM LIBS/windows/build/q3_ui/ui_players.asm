code
proc UI_PlayerInfo_SetWeapon 84 12
file "../../../code/q3_ui/ui_players.c"
line 53
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
;23:// ui_players.c
;24:
;25:#include "ui_local.h"
;26:
;27:
;28:#define UI_TIMER_GESTURE		2300
;29:#define UI_TIMER_JUMP			1000
;30:#define UI_TIMER_LAND			130
;31:#define UI_TIMER_WEAPON_SWITCH	300
;32:#define UI_TIMER_ATTACK			500
;33:#define	UI_TIMER_MUZZLE_FLASH	20
;34:#define	UI_TIMER_WEAPON_DELAY	250
;35:
;36:#define JUMP_HEIGHT				56
;37:
;38:#define SWINGSPEED				0.3f
;39:
;40:#define SPIN_SPEED				0.9f
;41:#define COAST_TIME				1000
;42:
;43:
;44:static int			dp_realtime;
;45:static float		jumpHeight;
;46:
;47:
;48:/*
;49:===============
;50:UI_PlayerInfo_SetWeapon
;51:===============
;52:*/
;53:static void UI_PlayerInfo_SetWeapon( playerInfo_t *pi, weapon_t weaponNum ) {
line 57
;54:	gitem_t *	item;
;55:	char		path[MAX_QPATH];
;56:
;57:	pi->currentWeapon = weaponNum;
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
LABELV $80
line 59
;58:tryagain:
;59:	pi->realWeapon = weaponNum;
ADDRFP4 0
INDIRP4
CNSTI4 1104
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 60
;60:	pi->weaponModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 61
;61:	pi->barrelModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 0
ASGNI4
line 62
;62:	pi->flashModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 0
ASGNI4
line 64
;63:
;64:	if ( weaponNum == WP_NONE ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $81
line 65
;65:		return;
ADDRGP4 $79
JUMPV
LABELV $81
line 68
;66:	}
;67:
;68:	for ( item = bg_itemlist + 1; item->classname ; item++ ) {
ADDRLP4 0
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $86
JUMPV
LABELV $83
line 69
;69:		if ( item->giType != IT_WEAPON ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
EQI4 $88
line 70
;70:			continue;
ADDRGP4 $84
JUMPV
LABELV $88
line 72
;71:		}
;72:		if ( item->giTag == weaponNum ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $90
line 73
;73:			break;
ADDRGP4 $85
JUMPV
LABELV $90
line 75
;74:		}
;75:	}
LABELV $84
line 68
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $86
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $83
LABELV $85
line 77
;76:
;77:	if ( item->classname ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $92
line 78
;78:		pi->weaponModel = trap_R_RegisterModel( item->world_model[0] );
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 79
;79:	}
LABELV $92
line 81
;80:
;81:	if( pi->weaponModel == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 0
NEI4 $94
line 82
;82:		if( weaponNum == WP_MACHINEGUN ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $96
line 83
;83:			weaponNum = WP_NONE;
ADDRFP4 4
CNSTI4 0
ASGNI4
line 84
;84:			goto tryagain;
ADDRGP4 $80
JUMPV
LABELV $96
line 86
;85:		}
;86:		weaponNum = WP_MACHINEGUN;
ADDRFP4 4
CNSTI4 2
ASGNI4
line 87
;87:		goto tryagain;
ADDRGP4 $80
JUMPV
LABELV $94
line 90
;88:	}
;89:
;90:	if ( weaponNum == WP_MACHINEGUN || weaponNum == WP_GAUNTLET || weaponNum == WP_BFG ) {
ADDRLP4 68
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $101
ADDRLP4 68
INDIRI4
CNSTI4 1
EQI4 $101
ADDRLP4 68
INDIRI4
CNSTI4 9
NEI4 $98
LABELV $101
line 91
;91:		strcpy( path, item->world_model[0] );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 92
;92:		COM_StripExtension( path, path, sizeof(path) );
ADDRLP4 4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 COM_StripExtension
CALLV
pop
line 93
;93:		strcat( path, "_barrel.md3" );
ADDRLP4 4
ARGP4
ADDRGP4 $102
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 94
;94:		pi->barrelModel = trap_R_RegisterModel( path );
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 95
;95:	}
LABELV $98
line 97
;96:
;97:	strcpy( path, item->world_model[0] );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 98
;98:	COM_StripExtension( path, path, sizeof(path) );
ADDRLP4 4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 COM_StripExtension
CALLV
pop
line 99
;99:	strcat( path, "_flash.md3" );
ADDRLP4 4
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 100
;100:	pi->flashModel = trap_R_RegisterModel( path );
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 102
;101:
;102:	switch( weaponNum ) {
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1
LTI4 $104
ADDRLP4 76
INDIRI4
CNSTI4 10
GTI4 $104
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $117-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $117
address $107
address $108
address $109
address $110
address $111
address $112
address $113
address $114
address $115
address $116
code
LABELV $107
line 104
;103:	case WP_GAUNTLET:
;104:		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTF4 1065353216
ASGNF4
line 105
;105:		break;
ADDRGP4 $105
JUMPV
LABELV $108
line 108
;106:
;107:	case WP_MACHINEGUN:
;108:		MAKERGB( pi->flashDlightColor, 1, 1, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTF4 0
ASGNF4
line 109
;109:		break;
ADDRGP4 $105
JUMPV
LABELV $109
line 112
;110:
;111:	case WP_SHOTGUN:
;112:		MAKERGB( pi->flashDlightColor, 1, 1, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTF4 0
ASGNF4
line 113
;113:		break;
ADDRGP4 $105
JUMPV
LABELV $110
line 116
;114:
;115:	case WP_GRENADE_LAUNCHER:
;116:		MAKERGB( pi->flashDlightColor, 1, 0.7f, 0.5f );
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
CNSTF4 1060320051
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTF4 1056964608
ASGNF4
line 117
;117:		break;
ADDRGP4 $105
JUMPV
LABELV $111
line 120
;118:
;119:	case WP_ROCKET_LAUNCHER:
;120:		MAKERGB( pi->flashDlightColor, 1, 0.75f, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
CNSTF4 1061158912
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTF4 0
ASGNF4
line 121
;121:		break;
ADDRGP4 $105
JUMPV
LABELV $112
line 124
;122:
;123:	case WP_LIGHTNING:
;124:		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTF4 1065353216
ASGNF4
line 125
;125:		break;
ADDRGP4 $105
JUMPV
LABELV $113
line 128
;126:
;127:	case WP_RAILGUN:
;128:		MAKERGB( pi->flashDlightColor, 1, 0.5f, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
CNSTF4 1056964608
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTF4 0
ASGNF4
line 129
;129:		break;
ADDRGP4 $105
JUMPV
LABELV $114
line 132
;130:
;131:	case WP_PLASMAGUN:
;132:		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTF4 1065353216
ASGNF4
line 133
;133:		break;
ADDRGP4 $105
JUMPV
LABELV $115
line 136
;134:
;135:	case WP_BFG:
;136:		MAKERGB( pi->flashDlightColor, 1, 0.7f, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
CNSTF4 1060320051
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTF4 1065353216
ASGNF4
line 137
;137:		break;
ADDRGP4 $105
JUMPV
LABELV $116
line 140
;138:
;139:	case WP_GRAPPLING_HOOK:
;140:		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTF4 1065353216
ASGNF4
line 141
;141:		break;
ADDRGP4 $105
JUMPV
LABELV $104
line 144
;142:
;143:	default:
;144:		MAKERGB( pi->flashDlightColor, 1, 1, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
CNSTF4 1065353216
ASGNF4
line 145
;145:		break;
LABELV $105
line 147
;146:	}
;147:}
LABELV $79
endproc UI_PlayerInfo_SetWeapon 84 12
proc UI_ForceLegsAnim 8 0
line 155
;148:
;149:
;150:/*
;151:===============
;152:UI_ForceLegsAnim
;153:===============
;154:*/
;155:static void UI_ForceLegsAnim( playerInfo_t *pi, int anim ) {
line 156
;156:	pi->legsAnim = ( ( pi->legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
ADDRFP4 4
INDIRI4
BORI4
ASGNI4
line 158
;157:
;158:	if ( anim == LEGS_JUMP ) {
ADDRFP4 4
INDIRI4
CNSTI4 18
NEI4 $120
line 159
;159:		pi->legsAnimationTimer = UI_TIMER_JUMP;
ADDRFP4 0
INDIRP4
CNSTI4 1080
ADDP4
CNSTI4 1000
ASGNI4
line 160
;160:	}
LABELV $120
line 161
;161:}
LABELV $119
endproc UI_ForceLegsAnim 8 0
proc UI_SetLegsAnim 0 8
line 169
;162:
;163:
;164:/*
;165:===============
;166:UI_SetLegsAnim
;167:===============
;168:*/
;169:static void UI_SetLegsAnim( playerInfo_t *pi, int anim ) {
line 170
;170:	if ( pi->pendingLegsAnim ) {
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
INDIRI4
CNSTI4 0
EQI4 $123
line 171
;171:		anim = pi->pendingLegsAnim;
ADDRFP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
INDIRI4
ASGNI4
line 172
;172:		pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
CNSTI4 0
ASGNI4
line 173
;173:	}
LABELV $123
line 174
;174:	UI_ForceLegsAnim( pi, anim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 175
;175:}
LABELV $122
endproc UI_SetLegsAnim 0 8
proc UI_ForceTorsoAnim 12 0
line 183
;176:
;177:
;178:/*
;179:===============
;180:UI_ForceTorsoAnim
;181:===============
;182:*/
;183:static void UI_ForceTorsoAnim( playerInfo_t *pi, int anim ) {
line 184
;184:	pi->torsoAnim = ( ( pi->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
ADDRFP4 4
INDIRI4
BORI4
ASGNI4
line 186
;185:
;186:	if ( anim == TORSO_GESTURE ) {
ADDRFP4 4
INDIRI4
CNSTI4 6
NEI4 $126
line 187
;187:		pi->torsoAnimationTimer = UI_TIMER_GESTURE;
ADDRFP4 0
INDIRP4
CNSTI4 1072
ADDP4
CNSTI4 2300
ASGNI4
line 188
;188:	}
LABELV $126
line 190
;189:
;190:	if ( anim == TORSO_ATTACK || anim == TORSO_ATTACK2 ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 7
EQI4 $130
ADDRLP4 8
INDIRI4
CNSTI4 8
NEI4 $128
LABELV $130
line 191
;191:		pi->torsoAnimationTimer = UI_TIMER_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 1072
ADDP4
CNSTI4 500
ASGNI4
line 192
;192:	}
LABELV $128
line 193
;193:}
LABELV $125
endproc UI_ForceTorsoAnim 12 0
proc UI_SetTorsoAnim 0 8
line 201
;194:
;195:
;196:/*
;197:===============
;198:UI_SetTorsoAnim
;199:===============
;200:*/
;201:static void UI_SetTorsoAnim( playerInfo_t *pi, int anim ) {
line 202
;202:	if ( pi->pendingTorsoAnim ) {
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
INDIRI4
CNSTI4 0
EQI4 $132
line 203
;203:		anim = pi->pendingTorsoAnim;
ADDRFP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
INDIRI4
ASGNI4
line 204
;204:		pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
CNSTI4 0
ASGNI4
line 205
;205:	}
LABELV $132
line 207
;206:
;207:	UI_ForceTorsoAnim( pi, anim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 208
;208:}
LABELV $131
endproc UI_SetTorsoAnim 0 8
proc UI_TorsoSequencing 16 8
line 216
;209:
;210:
;211:/*
;212:===============
;213:UI_TorsoSequencing
;214:===============
;215:*/
;216:static void UI_TorsoSequencing( playerInfo_t *pi ) {
line 219
;217:	int		currentAnim;
;218:
;219:	currentAnim = pi->torsoAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 221
;220:
;221:	if ( pi->weapon != pi->currentWeapon ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
EQI4 $135
line 222
;222:		if ( currentAnim != TORSO_DROP ) {
ADDRLP4 0
INDIRI4
CNSTI4 9
EQI4 $137
line 223
;223:			pi->torsoAnimationTimer = UI_TIMER_WEAPON_SWITCH;
ADDRFP4 0
INDIRP4
CNSTI4 1072
ADDP4
CNSTI4 300
ASGNI4
line 224
;224:			UI_ForceTorsoAnim( pi, TORSO_DROP );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 225
;225:		}
LABELV $137
line 226
;226:	}
LABELV $135
line 228
;227:
;228:	if ( pi->torsoAnimationTimer > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $139
line 229
;229:		return;
ADDRGP4 $134
JUMPV
LABELV $139
line 232
;230:	}
;231:
;232:	if( currentAnim == TORSO_GESTURE ) {
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $141
line 233
;233:		UI_SetTorsoAnim( pi, TORSO_STAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 UI_SetTorsoAnim
CALLV
pop
line 234
;234:		return;
ADDRGP4 $134
JUMPV
LABELV $141
line 237
;235:	}
;236:
;237:	if( currentAnim == TORSO_ATTACK || currentAnim == TORSO_ATTACK2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 7
EQI4 $145
ADDRLP4 0
INDIRI4
CNSTI4 8
NEI4 $143
LABELV $145
line 238
;238:		UI_SetTorsoAnim( pi, TORSO_STAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 UI_SetTorsoAnim
CALLV
pop
line 239
;239:		return;
ADDRGP4 $134
JUMPV
LABELV $143
line 242
;240:	}
;241:
;242:	if ( currentAnim == TORSO_DROP ) {
ADDRLP4 0
INDIRI4
CNSTI4 9
NEI4 $146
line 243
;243:		UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 244
;244:		pi->torsoAnimationTimer = UI_TIMER_WEAPON_SWITCH;
ADDRFP4 0
INDIRP4
CNSTI4 1072
ADDP4
CNSTI4 300
ASGNI4
line 245
;245:		UI_ForceTorsoAnim( pi, TORSO_RAISE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 246
;246:		return;
ADDRGP4 $134
JUMPV
LABELV $146
line 249
;247:	}
;248:
;249:	if ( currentAnim == TORSO_RAISE ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $148
line 250
;250:		UI_SetTorsoAnim( pi, TORSO_STAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 UI_SetTorsoAnim
CALLV
pop
line 251
;251:		return;
LABELV $148
line 253
;252:	}
;253:}
LABELV $134
endproc UI_TorsoSequencing 16 8
proc UI_LegsSequencing 8 8
line 261
;254:
;255:
;256:/*
;257:===============
;258:UI_LegsSequencing
;259:===============
;260:*/
;261:static void UI_LegsSequencing( playerInfo_t *pi ) {
line 264
;262:	int		currentAnim;
;263:
;264:	currentAnim = pi->legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 266
;265:
;266:	if ( pi->legsAnimationTimer > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1080
ADDP4
INDIRI4
CNSTI4 0
LEI4 $151
line 267
;267:		if ( currentAnim == LEGS_JUMP ) {
ADDRLP4 0
INDIRI4
CNSTI4 18
NEI4 $150
line 268
;268:			jumpHeight = JUMP_HEIGHT * sin( M_PI * ( UI_TIMER_JUMP - pi->legsAnimationTimer ) / UI_TIMER_JUMP );
CNSTF4 1078530011
CNSTI4 1000
ADDRFP4 0
INDIRP4
CNSTI4 1080
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 4
ADDRGP4 sin
CALLF4
ASGNF4
ADDRGP4 jumpHeight
CNSTF4 1113587712
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 269
;269:		}
line 270
;270:		return;
ADDRGP4 $150
JUMPV
LABELV $151
line 273
;271:	}
;272:
;273:	if ( currentAnim == LEGS_JUMP ) {
ADDRLP4 0
INDIRI4
CNSTI4 18
NEI4 $155
line 274
;274:		UI_ForceLegsAnim( pi, LEGS_LAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 275
;275:		pi->legsAnimationTimer = UI_TIMER_LAND;
ADDRFP4 0
INDIRP4
CNSTI4 1080
ADDP4
CNSTI4 130
ASGNI4
line 276
;276:		jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 277
;277:		return;
ADDRGP4 $150
JUMPV
LABELV $155
line 280
;278:	}
;279:
;280:	if ( currentAnim == LEGS_LAND ) {
ADDRLP4 0
INDIRI4
CNSTI4 19
NEI4 $157
line 281
;281:		UI_SetLegsAnim( pi, LEGS_IDLE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRGP4 UI_SetLegsAnim
CALLV
pop
line 282
;282:		return;
LABELV $157
line 284
;283:	}
;284:}
LABELV $150
endproc UI_LegsSequencing 8 8
proc UI_PositionEntityOnTag 84 24
line 293
;285:
;286:
;287:/*
;288:======================
;289:UI_PositionEntityOnTag
;290:======================
;291:*/
;292:static void UI_PositionEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;293:							clipHandle_t parentModel, char *tagName ) {
line 298
;294:	int				i;
;295:	orientation_t	lerped;
;296:	
;297:	// lerp the tag
;298:	trap_CM_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_CM_LerpTag
CALLI4
pop
line 302
;299:		1.0 - parent->backlerp, tagName );
;300:
;301:	// FIXME: allow origin offsets along tag?
;302:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 56
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 303
;303:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $160
line 304
;304:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 305
;305:	}
LABELV $161
line 303
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $160
line 308
;306:
;307:	// cast away const because of compiler problems
;308:	MatrixMultiply( lerped.axis, ((refEntity_t*)parent)->axis, entity->axis );
ADDRLP4 4+12
ARGP4
ADDRLP4 60
CNSTI4 28
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 309
;309:	entity->backlerp = parent->backlerp;
ADDRLP4 64
CNSTI4 100
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 310
;310:}
LABELV $159
endproc UI_PositionEntityOnTag 84 24
proc UI_PositionRotatedEntityOnTag 120 24
line 319
;311:
;312:
;313:/*
;314:======================
;315:UI_PositionRotatedEntityOnTag
;316:======================
;317:*/
;318:static void UI_PositionRotatedEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;319:							clipHandle_t parentModel, char *tagName ) {
line 325
;320:	int				i;
;321:	orientation_t	lerped;
;322:	vec3_t			tempAxis[3];
;323:
;324:	// lerp the tag
;325:	trap_CM_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 88
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_CM_LerpTag
CALLI4
pop
line 329
;326:		1.0 - parent->backlerp, tagName );
;327:
;328:	// FIXME: allow origin offsets along tag?
;329:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 92
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 330
;330:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $166
line 331
;331:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 332
;332:	}
LABELV $167
line 330
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $166
line 335
;333:
;334:	// cast away const because of compiler problems
;335:	MatrixMultiply( entity->axis, ((refEntity_t *)parent)->axis, tempAxis );
ADDRLP4 96
CNSTI4 28
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 336
;336:	MatrixMultiply( lerped.axis, tempAxis, entity->axis );
ADDRLP4 4+12
ARGP4
ADDRLP4 52
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 337
;337:}
LABELV $165
endproc UI_PositionRotatedEntityOnTag 120 24
proc UI_SetLerpFrameAnimation 12 8
line 345
;338:
;339:
;340:/*
;341:===============
;342:UI_SetLerpFrameAnimation
;343:===============
;344:*/
;345:static void UI_SetLerpFrameAnimation( playerInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 348
;346:	animation_t	*anim;
;347:
;348:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 349
;349:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 351
;350:
;351:	if ( newAnimation < 0 || newAnimation >= MAX_ANIMATIONS ) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $174
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $172
LABELV $174
line 352
;352:		trap_Error( va("Bad animation number: %i", newAnimation) );
ADDRGP4 $175
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 353
;353:	}
LABELV $172
line 355
;354:
;355:	anim = &ci->animations[ newAnimation ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
ASGNP4
line 357
;356:
;357:	lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 358
;358:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 359
;359:}
LABELV $171
endproc UI_SetLerpFrameAnimation 12 8
proc UI_RunLerpFrame 32 12
line 367
;360:
;361:
;362:/*
;363:===============
;364:UI_RunLerpFrame
;365:===============
;366:*/
;367:static void UI_RunLerpFrame( playerInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 372
;368:	int			f;
;369:	animation_t	*anim;
;370:
;371:	// see if the animation sequence is switching
;372:	if ( newAnimation != lf->animationNumber || !lf->animation ) {
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $179
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $177
LABELV $179
line 373
;373:		UI_SetLerpFrameAnimation( ci, lf, newAnimation );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_SetLerpFrameAnimation
CALLV
pop
line 374
;374:	}
LABELV $177
line 378
;375:
;376:	// if we have passed the current frame, move it to
;377:	// oldFrame and calculate a new frame
;378:	if ( dp_realtime >= lf->frameTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $180
line 379
;379:		lf->oldFrame = lf->frame;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 380
;380:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 383
;381:
;382:		// get the next frame based on the animation
;383:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 384
;384:		if ( dp_realtime < lf->animationTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $182
line 385
;385:			lf->frameTime = lf->animationTime;		// initial lerp
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 386
;386:		} else {
ADDRGP4 $183
JUMPV
LABELV $182
line 387
;387:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 12
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 388
;388:		}
LABELV $183
line 389
;389:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 12
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
DIVI4
ASGNI4
line 390
;390:		if ( f >= anim->numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $184
line 391
;391:			f -= anim->numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 392
;392:			if ( anim->loopFrames ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $186
line 393
;393:				f %= anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MODI4
ASGNI4
line 394
;394:				f += anim->numFrames - anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 395
;395:			} else {
ADDRGP4 $187
JUMPV
LABELV $186
line 396
;396:				f = anim->numFrames - 1;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 399
;397:				// the animation is stuck at the end, so it
;398:				// can immediately transition to another sequence
;399:				lf->frameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 400
;400:			}
LABELV $187
line 401
;401:		}
LABELV $184
line 402
;402:		lf->frame = anim->firstFrame + f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 403
;403:		if ( dp_realtime > lf->frameTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $188
line 404
;404:			lf->frameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 405
;405:		}
LABELV $188
line 406
;406:	}
LABELV $180
line 408
;407:
;408:	if ( lf->frameTime > dp_realtime + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 dp_realtime
INDIRI4
CNSTI4 200
ADDI4
LEI4 $190
line 409
;409:		lf->frameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 410
;410:	}
LABELV $190
line 412
;411:
;412:	if ( lf->oldFrameTime > dp_realtime ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 dp_realtime
INDIRI4
LEI4 $192
line 413
;413:		lf->oldFrameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 414
;414:	}
LABELV $192
line 416
;415:	// calculate current lerp value
;416:	if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $194
line 417
;417:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 418
;418:	} else {
ADDRGP4 $195
JUMPV
LABELV $194
line 419
;419:		lf->backlerp = 1.0 - (float)( dp_realtime - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 dp_realtime
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 420
;420:	}
LABELV $195
line 421
;421:}
LABELV $176
endproc UI_RunLerpFrame 32 12
proc UI_PlayerAnimation 16 12
line 430
;422:
;423:
;424:/*
;425:===============
;426:UI_PlayerAnimation
;427:===============
;428:*/
;429:static void UI_PlayerAnimation( playerInfo_t *pi, int *legsOld, int *legs, float *legsBackLerp,
;430:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 433
;431:
;432:	// legs animation
;433:	pi->legsAnimationTimer -= uis.frametime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1080
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 uis
INDIRI4
SUBI4
ASGNI4
line 434
;434:	if ( pi->legsAnimationTimer < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1080
ADDP4
INDIRI4
CNSTI4 0
GEI4 $197
line 435
;435:		pi->legsAnimationTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1080
ADDP4
CNSTI4 0
ASGNI4
line 436
;436:	}
LABELV $197
line 438
;437:
;438:	UI_LegsSequencing( pi );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_LegsSequencing
CALLV
pop
line 440
;439:
;440:	if ( pi->legs.yawing && ( pi->legsAnim & ~ANIM_TOGGLEBIT ) == LEGS_IDLE ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $199
ADDRLP4 4
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $199
line 441
;441:		UI_RunLerpFrame( pi, &pi->legs, LEGS_TURN );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ARGP4
CNSTI4 24
ARGI4
ADDRGP4 UI_RunLerpFrame
CALLV
pop
line 442
;442:	} else {
ADDRGP4 $200
JUMPV
LABELV $199
line 443
;443:		UI_RunLerpFrame( pi, &pi->legs, pi->legsAnim );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_RunLerpFrame
CALLV
pop
line 444
;444:	}
LABELV $200
line 445
;445:	*legsOld = pi->legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 446
;446:	*legs = pi->legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 447
;447:	*legsBackLerp = pi->legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 450
;448:
;449:	// torso animation
;450:	pi->torsoAnimationTimer -= uis.frametime;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1072
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRGP4 uis
INDIRI4
SUBI4
ASGNI4
line 451
;451:	if ( pi->torsoAnimationTimer < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1072
ADDP4
INDIRI4
CNSTI4 0
GEI4 $201
line 452
;452:		pi->torsoAnimationTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1072
ADDP4
CNSTI4 0
ASGNI4
line 453
;453:	}
LABELV $201
line 455
;454:
;455:	UI_TorsoSequencing( pi );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_TorsoSequencing
CALLV
pop
line 457
;456:
;457:	UI_RunLerpFrame( pi, &pi->torso, pi->torsoAnim );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_RunLerpFrame
CALLV
pop
line 458
;458:	*torsoOld = pi->torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 459
;459:	*torso = pi->torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ASGNI4
line 460
;460:	*torsoBackLerp = pi->torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ASGNF4
line 461
;461:}
LABELV $196
endproc UI_PlayerAnimation 16 12
proc UI_SwingAngles 28 8
line 470
;462:
;463:
;464:/*
;465:==================
;466:UI_SwingAngles
;467:==================
;468:*/
;469:static void UI_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;470:					float speed, float *angle, qboolean *swinging ) {
line 475
;471:	float	swing;
;472:	float	move;
;473:	float	scale;
;474:
;475:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $204
line 477
;476:		// see if a swing should be started
;477:		swing = AngleSubtract( *angle, destination );
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 478
;478:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $208
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $206
LABELV $208
line 479
;479:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 480
;480:		}
LABELV $206
line 481
;481:	}
LABELV $204
line 483
;482:
;483:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $209
line 484
;484:		return;
ADDRGP4 $203
JUMPV
LABELV $209
line 489
;485:	}
;486:	
;487:	// modify the speed depending on the delta
;488:	// so it doesn't seem so linear
;489:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 490
;490:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 491
;491:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
GEF4 $211
line 492
;492:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 493
;493:	} else if ( scale < swingTolerance ) {
ADDRGP4 $212
JUMPV
LABELV $211
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $213
line 494
;494:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 495
;495:	} else {
ADDRGP4 $214
JUMPV
LABELV $213
line 496
;496:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 497
;497:	}
LABELV $214
LABELV $212
line 500
;498:
;499:	// swing towards the destination angle
;500:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $215
line 501
;501:		move = uis.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 uis
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 502
;502:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $217
line 503
;503:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 504
;504:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 505
;505:		}
LABELV $217
line 506
;506:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 507
;507:	} else if ( swing < 0 ) {
ADDRGP4 $216
JUMPV
LABELV $215
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $219
line 508
;508:		move = uis.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 uis
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 509
;509:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $221
line 510
;510:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 511
;511:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 512
;512:		}
LABELV $221
line 513
;513:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 514
;514:	}
LABELV $219
LABELV $216
line 517
;515:
;516:	// clamp to no more than tolerance
;517:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 518
;518:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $223
line 519
;519:		*angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 520
;520:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $224
JUMPV
LABELV $223
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $225
line 521
;521:		*angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 522
;522:	}
LABELV $225
LABELV $224
line 523
;523:}
LABELV $203
endproc UI_SwingAngles 28 8
proc UI_MovedirAdjustment 72 16
line 531
;524:
;525:
;526:/*
;527:======================
;528:UI_MovedirAdjustment
;529:======================
;530:*/
;531:static float UI_MovedirAdjustment( playerInfo_t *pi ) {
line 535
;532:	vec3_t		relativeAngles;
;533:	vec3_t		moveVector;
;534:
;535:	VectorSubtract( pi->viewAngles, pi->moveAngles, relativeAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1028
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1032
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 28
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 1036
ADDP4
INDIRF4
SUBF4
ASGNF4
line 536
;536:	AngleVectors( relativeAngles, moveVector, NULL, NULL );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 537
;537:	if ( Q_fabs( moveVector[0] ) < 0.01 ) {
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Q_fabs
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 1008981770
GEF4 $230
line 538
;538:		moveVector[0] = 0.0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 539
;539:	}
LABELV $230
line 540
;540:	if ( Q_fabs( moveVector[1] ) < 0.01 ) {
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Q_fabs
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1008981770
GEF4 $232
line 541
;541:		moveVector[1] = 0.0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 542
;542:	}
LABELV $232
line 544
;543:
;544:	if ( moveVector[1] == 0 && moveVector[0] > 0 ) {
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44
INDIRF4
NEF4 $236
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
LEF4 $236
line 545
;545:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $227
JUMPV
LABELV $236
line 547
;546:	}
;547:	if ( moveVector[1] < 0 && moveVector[0] > 0 ) {
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48
INDIRF4
GEF4 $239
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRF4
LEF4 $239
line 548
;548:		return 22;
CNSTF4 1102053376
RETF4
ADDRGP4 $227
JUMPV
LABELV $239
line 550
;549:	}
;550:	if ( moveVector[1] < 0 && moveVector[0] == 0 ) {
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 52
INDIRF4
GEF4 $242
ADDRLP4 0
INDIRF4
ADDRLP4 52
INDIRF4
NEF4 $242
line 551
;551:		return 45;
CNSTF4 1110704128
RETF4
ADDRGP4 $227
JUMPV
LABELV $242
line 553
;552:	}
;553:	if ( moveVector[1] < 0 && moveVector[0] < 0 ) {
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 56
INDIRF4
GEF4 $245
ADDRLP4 0
INDIRF4
ADDRLP4 56
INDIRF4
GEF4 $245
line 554
;554:		return -22;
CNSTF4 3249537024
RETF4
ADDRGP4 $227
JUMPV
LABELV $245
line 556
;555:	}
;556:	if ( moveVector[1] == 0 && moveVector[0] < 0 ) {
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 60
INDIRF4
NEF4 $248
ADDRLP4 0
INDIRF4
ADDRLP4 60
INDIRF4
GEF4 $248
line 557
;557:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $227
JUMPV
LABELV $248
line 559
;558:	}
;559:	if ( moveVector[1] > 0 && moveVector[0] < 0 ) {
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 64
INDIRF4
LEF4 $251
ADDRLP4 0
INDIRF4
ADDRLP4 64
INDIRF4
GEF4 $251
line 560
;560:		return 22;
CNSTF4 1102053376
RETF4
ADDRGP4 $227
JUMPV
LABELV $251
line 562
;561:	}
;562:	if ( moveVector[1] > 0 && moveVector[0] == 0 ) {
ADDRLP4 68
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68
INDIRF4
LEF4 $254
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
NEF4 $254
line 563
;563:		return  -45;
CNSTF4 3258187776
RETF4
ADDRGP4 $227
JUMPV
LABELV $254
line 566
;564:	}
;565:
;566:	return -22;
CNSTF4 3249537024
RETF4
LABELV $227
endproc UI_MovedirAdjustment 72 16
proc UI_PlayerAngles 80 24
line 575
;567:}
;568:
;569:
;570:/*
;571:===============
;572:UI_PlayerAngles
;573:===============
;574:*/
;575:static void UI_PlayerAngles( playerInfo_t *pi, vec3_t legs[3], vec3_t torso[3], vec3_t head[3] ) {
line 580
;576:	vec3_t		legsAngles, torsoAngles, headAngles;
;577:	float		dest;
;578:	float		adjust;
;579:
;580:	VectorCopy( pi->viewAngles, headAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRB
ASGNB 12
line 581
;581:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 44
INDIRF4
ASGNF4
line 582
;582:	VectorClear( legsAngles );
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 24+8
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 48
INDIRF4
ASGNF4
line 583
;583:	VectorClear( torsoAngles );
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 52
INDIRF4
ASGNF4
line 588
;584:
;585:	// --------- yaw -------------
;586:
;587:	// allow yaw to drift a bit
;588:	if ( ( pi->legsAnim & ~ANIM_TOGGLEBIT ) != LEGS_IDLE 
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 -129
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
BANDI4
CNSTI4 22
NEI4 $266
ADDRLP4 56
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
BANDI4
CNSTI4 11
EQI4 $264
LABELV $266
line 589
;589:		|| ( pi->torsoAnim & ~ANIM_TOGGLEBIT ) != TORSO_STAND  ) {
line 591
;590:		// if not standing still, always point all in the same direction
;591:		pi->torso.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 592
;592:		pi->torso.pitching = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 1
ASGNI4
line 593
;593:		pi->legs.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 1
ASGNI4
line 594
;594:	}
LABELV $264
line 597
;595:
;596:	// adjust legs for movement dir
;597:	adjust = UI_MovedirAdjustment( pi );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 UI_MovedirAdjustment
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 64
INDIRF4
ASGNF4
line 598
;598:	legsAngles[YAW] = headAngles[YAW] + adjust;
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
line 599
;599:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * adjust;
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ASGNF4
line 603
;600:
;601:
;602:	// torso
;603:	UI_SwingAngles( torsoAngles[YAW], 25, 90, SWINGSPEED, &pi->torso.yawAngle, &pi->torso.yawing );
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1050253722
ARGF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 88
ADDP4
ARGP4
ADDRGP4 UI_SwingAngles
CALLV
pop
line 604
;604:	UI_SwingAngles( legsAngles[YAW], 40, 90, SWINGSPEED, &pi->legs.yawAngle, &pi->legs.yawing );
ADDRLP4 24+4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1050253722
ARGF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 UI_SwingAngles
CALLV
pop
line 606
;605:
;606:	torsoAngles[YAW] = pi->torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ASGNF4
line 607
;607:	legsAngles[YAW] = pi->legs.yawAngle;
ADDRLP4 24+4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 612
;608:
;609:	// --------- pitch -------------
;610:
;611:	// only show a fraction of the pitch angle in the torso
;612:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LEF4 $275
line 613
;613:		dest = (-360 + headAngles[PITCH]) * 0.75;
ADDRLP4 40
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 614
;614:	} else {
ADDRGP4 $276
JUMPV
LABELV $275
line 615
;615:		dest = headAngles[PITCH] * 0.75;
ADDRLP4 40
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 616
;616:	}
LABELV $276
line 617
;617:	UI_SwingAngles( dest, 15, 30, 0.1f, &pi->torso.pitchAngle, &pi->torso.pitching );
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 96
ADDP4
ARGP4
ADDRGP4 UI_SwingAngles
CALLV
pop
line 618
;618:	torsoAngles[PITCH] = pi->torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
line 621
;619:
;620:	// pull the angles back out of the hierarchial chain
;621:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 622
;622:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 623
;623:	AnglesToAxis( legsAngles, legs );
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 624
;624:	AnglesToAxis( torsoAngles, torso );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 625
;625:	AnglesToAxis( headAngles, head );
ADDRLP4 12
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 626
;626:}
LABELV $257
endproc UI_PlayerAngles 80 24
proc UI_PlayerFloatSprite 140 12
line 634
;627:
;628:
;629:/*
;630:===============
;631:UI_PlayerFloatSprite
;632:===============
;633:*/
;634:static void UI_PlayerFloatSprite( playerInfo_t *pi, vec3_t origin, qhandle_t shader ) {
line 637
;635:	refEntity_t		ent;
;636:
;637:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 638
;638:	VectorCopy( origin, ent.origin );
ADDRLP4 0+68
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 639
;639:	ent.origin[2] += 48;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 640
;640:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 641
;641:	ent.customShader = shader;
ADDRLP4 0+112
ADDRFP4 8
INDIRI4
ASGNI4
line 642
;642:	ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 643
;643:	ent.renderfx = 0;
ADDRLP4 0+4
CNSTI4 0
ASGNI4
line 644
;644:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 645
;645:}
LABELV $277
endproc UI_PlayerFloatSprite 140 12
export UI_MachinegunSpinAngle
proc UI_MachinegunSpinAngle 28 4
line 653
;646:
;647:
;648:/*
;649:======================
;650:UI_MachinegunSpinAngle
;651:======================
;652:*/
;653:float	UI_MachinegunSpinAngle( playerInfo_t *pi ) {
line 659
;654:	int		delta;
;655:	float	angle;
;656:	float	speed;
;657:	int		torsoAnim;
;658:
;659:	delta = dp_realtime - pi->barrelTime;
ADDRLP4 4
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
INDIRI4
SUBI4
ASGNI4
line 660
;660:	if ( pi->barrelSpinning ) {
ADDRFP4 0
INDIRP4
CNSTI4 1092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $285
line 661
;661:		angle = pi->barrelAngle + delta * SPIN_SPEED;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 1063675494
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 662
;662:	} else {
ADDRGP4 $286
JUMPV
LABELV $285
line 663
;663:		if ( delta > COAST_TIME ) {
ADDRLP4 4
INDIRI4
CNSTI4 1000
LEI4 $287
line 664
;664:			delta = COAST_TIME;
ADDRLP4 4
CNSTI4 1000
ASGNI4
line 665
;665:		}
LABELV $287
line 667
;666:
;667:		speed = 0.5 * ( SPIN_SPEED + (float)( COAST_TIME - delta ) / COAST_TIME );
ADDRLP4 12
CNSTF4 1056964608
CNSTI4 1000
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
CNSTF4 1063675494
ADDF4
MULF4
ASGNF4
line 668
;668:		angle = pi->barrelAngle + delta * speed;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 669
;669:	}
LABELV $286
line 671
;670:
;671:	torsoAnim = pi->torsoAnim  & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 672
;672:	if( torsoAnim == TORSO_ATTACK2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
NEI4 $289
line 673
;673:		torsoAnim = TORSO_ATTACK;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 674
;674:	}
LABELV $289
line 675
;675:	if ( pi->barrelSpinning == !(torsoAnim == TORSO_ATTACK) ) {
ADDRLP4 0
INDIRI4
CNSTI4 7
EQI4 $294
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $295
JUMPV
LABELV $294
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $295
ADDRFP4 0
INDIRP4
CNSTI4 1092
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $291
line 676
;676:		pi->barrelTime = dp_realtime;
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 677
;677:		pi->barrelAngle = AngleMod( angle );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1096
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 678
;678:		pi->barrelSpinning = !!(torsoAnim == TORSO_ATTACK);
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $297
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $298
JUMPV
LABELV $297
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $298
ADDRFP4 0
INDIRP4
CNSTI4 1092
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 679
;679:	}
LABELV $291
line 681
;680:
;681:	return angle;
ADDRLP4 8
INDIRF4
RETF4
LABELV $284
endproc UI_MachinegunSpinAngle 28 4
lit
align 4
LABELV $300
byte 4 3246391296
byte 4 3246391296
byte 4 3250585600
align 4
LABELV $301
byte 4 1098907648
byte 4 1098907648
byte 4 1107296256
export UI_DrawPlayer
code
proc UI_DrawPlayer 1304 28
line 690
;682:}
;683:
;684:
;685:/*
;686:===============
;687:UI_DrawPlayer
;688:===============
;689:*/
;690:void UI_DrawPlayer( float x, float y, float w, float h, playerInfo_t *pi, int time ) {
line 700
;691:	refdef_t		refdef;
;692:	refEntity_t		legs;
;693:	refEntity_t		torso;
;694:	refEntity_t		head;
;695:	refEntity_t		gun;
;696:	refEntity_t		barrel;
;697:	refEntity_t		flash;
;698:	vec3_t			origin;
;699:	int				renderfx;
;700:	vec3_t			mins = {-16, -16, -24};
ADDRLP4 1084
ADDRGP4 $300
INDIRB
ASGNB 12
line 701
;701:	vec3_t			maxs = {16, 16, 32};
ADDRLP4 1096
ADDRGP4 $301
INDIRB
ASGNB 12
line 705
;702:	float			len;
;703:	float			xx;
;704:
;705:	if ( !pi->legsModel || !pi->torsoModel || !pi->headModel || !pi->animations[0].numFrames ) {
ADDRLP4 1256
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1260
CNSTI4 0
ASGNI4
ADDRLP4 1256
INDIRP4
INDIRI4
ADDRLP4 1260
INDIRI4
EQI4 $306
ADDRLP4 1256
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 1260
INDIRI4
EQI4 $306
ADDRLP4 1256
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 1260
INDIRI4
EQI4 $306
ADDRLP4 1256
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ADDRLP4 1260
INDIRI4
NEI4 $302
LABELV $306
line 706
;706:		return;
ADDRGP4 $299
JUMPV
LABELV $302
line 709
;707:	}
;708:
;709:	dp_realtime = time;
ADDRGP4 dp_realtime
ADDRFP4 20
INDIRI4
ASGNI4
line 711
;710:
;711:	if ( pi->pendingWeapon != -1 && dp_realtime > pi->weaponTimer ) {
ADDRLP4 1264
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1264
INDIRP4
CNSTI4 1060
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $307
ADDRGP4 dp_realtime
INDIRI4
ADDRLP4 1264
INDIRP4
CNSTI4 1064
ADDP4
INDIRI4
LEI4 $307
line 712
;712:		pi->weapon = pi->pendingWeapon;
ADDRLP4 1268
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1268
INDIRP4
CNSTI4 1052
ADDP4
ADDRLP4 1268
INDIRP4
CNSTI4 1060
ADDP4
INDIRI4
ASGNI4
line 713
;713:		pi->lastWeapon = pi->pendingWeapon;
ADDRLP4 1272
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1272
INDIRP4
CNSTI4 1056
ADDP4
ADDRLP4 1272
INDIRP4
CNSTI4 1060
ADDP4
INDIRI4
ASGNI4
line 714
;714:		pi->pendingWeapon = -1;
ADDRFP4 16
INDIRP4
CNSTI4 1060
ADDP4
CNSTI4 -1
ASGNI4
line 715
;715:		pi->weaponTimer = 0;
ADDRFP4 16
INDIRP4
CNSTI4 1064
ADDP4
CNSTI4 0
ASGNI4
line 716
;716:		if( pi->currentWeapon != pi->weapon ) {
ADDRLP4 1276
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1276
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
ADDRLP4 1276
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
EQI4 $309
line 717
;717:			trap_S_StartLocalSound( weaponChangeSound, CHAN_LOCAL );
ADDRGP4 weaponChangeSound
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 718
;718:		}
LABELV $309
line 719
;719:	}
LABELV $307
line 721
;720:
;721:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 723
;722:
;723:	y -= jumpHeight;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRGP4 jumpHeight
INDIRF4
SUBF4
ASGNF4
line 725
;724:
;725:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 726
;726:	memset( &legs, 0, sizeof(legs) );
ADDRLP4 380
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 727
;727:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 520
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 728
;728:	memset( &head, 0, sizeof(head) );
ADDRLP4 660
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 730
;729:
;730:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 732
;731:
;732:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 734
;733:
;734:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 735
;735:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 736
;736:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 737
;737:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 739
;738:
;739:	refdef.fov_x = (int)((float)refdef.width / 640.0f * 90.0f);
ADDRLP4 0+16
CNSTF4 1119092736
ADDRLP4 0+8
INDIRI4
CVIF4 4
CNSTF4 1142947840
DIVF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 740
;740:	xx = refdef.width / tan( refdef.fov_x / 360 * M_PI );
CNSTF4 1078530011
ADDRLP4 0+16
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
ARGF4
ADDRLP4 1268
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 1252
ADDRLP4 0+8
INDIRI4
CVIF4 4
ADDRLP4 1268
INDIRF4
DIVF4
ASGNF4
line 741
;741:	refdef.fov_y = atan2( refdef.height, xx );
ADDRLP4 0+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1252
INDIRF4
ARGF4
ADDRLP4 1272
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0+20
ADDRLP4 1272
INDIRF4
ASGNF4
line 742
;742:	refdef.fov_y *= ( 360 / M_PI );
ADDRLP4 0+20
CNSTF4 1122316001
ADDRLP4 0+20
INDIRF4
MULF4
ASGNF4
line 745
;743:
;744:	// calculate distance so the player nearly fills the box
;745:	len = 0.7 * ( maxs[2] - mins[2] );		
ADDRLP4 1248
CNSTF4 1060320051
ADDRLP4 1096+8
INDIRF4
ADDRLP4 1084+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 746
;746:	origin[0] = len / tan( DEG2RAD(refdef.fov_x) * 0.5 );
CNSTF4 1056964608
CNSTF4 1078530011
ADDRLP4 0+16
INDIRF4
MULF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 1276
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 368
ADDRLP4 1248
INDIRF4
ADDRLP4 1276
INDIRF4
DIVF4
ASGNF4
line 747
;747:	origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 368+4
CNSTF4 1056964608
ADDRLP4 1084+4
INDIRF4
ADDRLP4 1096+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 748
;748:	origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 368+8
CNSTF4 3204448256
ADDRLP4 1084+8
INDIRF4
ADDRLP4 1096+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 750
;749:
;750:	refdef.time = dp_realtime;
ADDRLP4 0+72
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 752
;751:
;752:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 755
;753:
;754:	// get the rotation information
;755:	UI_PlayerAngles( pi, legs.axis, torso.axis, head.axis );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 380+28
ARGP4
ADDRLP4 520+28
ARGP4
ADDRLP4 660+28
ARGP4
ADDRGP4 UI_PlayerAngles
CALLV
pop
line 758
;756:	
;757:	// get the animation state (after rotation, to allow feet shuffle)
;758:	UI_PlayerAnimation( pi, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 380+96
ARGP4
ADDRLP4 380+80
ARGP4
ADDRLP4 380+100
ARGP4
ADDRLP4 520+96
ARGP4
ADDRLP4 520+80
ARGP4
ADDRLP4 520+100
ARGP4
ADDRGP4 UI_PlayerAnimation
CALLV
pop
line 761
;759:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;760:
;761:	renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
ADDRLP4 800
CNSTI4 192
ASGNI4
line 766
;762:
;763:	//
;764:	// add the legs
;765:	//
;766:	legs.hModel = pi->legsModel;
ADDRLP4 380+8
ADDRFP4 16
INDIRP4
INDIRI4
ASGNI4
line 767
;767:	legs.customSkin = pi->legsSkin;
ADDRLP4 380+108
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 769
;768:
;769:	VectorCopy( origin, legs.origin );
ADDRLP4 380+68
ADDRLP4 368
INDIRB
ASGNB 12
line 771
;770:
;771:	VectorCopy( origin, legs.lightingOrigin );
ADDRLP4 380+12
ADDRLP4 368
INDIRB
ASGNB 12
line 772
;772:	legs.renderfx = renderfx;
ADDRLP4 380+4
ADDRLP4 800
INDIRI4
ASGNI4
line 773
;773:	VectorCopy (legs.origin, legs.oldorigin);
ADDRLP4 380+84
ADDRLP4 380+68
INDIRB
ASGNB 12
line 775
;774:
;775:	trap_R_AddRefEntityToScene( &legs );
ADDRLP4 380
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 777
;776:
;777:	if (!legs.hModel) {
ADDRLP4 380+8
INDIRI4
CNSTI4 0
NEI4 $349
line 778
;778:		return;
ADDRGP4 $299
JUMPV
LABELV $349
line 784
;779:	}
;780:
;781:	//
;782:	// add the torso
;783:	//
;784:	torso.hModel = pi->torsoModel;
ADDRLP4 520+8
ADDRFP4 16
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ASGNI4
line 785
;785:	if (!torso.hModel) {
ADDRLP4 520+8
INDIRI4
CNSTI4 0
NEI4 $353
line 786
;786:		return;
ADDRGP4 $299
JUMPV
LABELV $353
line 789
;787:	}
;788:
;789:	torso.customSkin = pi->torsoSkin;
ADDRLP4 520+108
ADDRFP4 16
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ASGNI4
line 791
;790:
;791:	VectorCopy( origin, torso.lightingOrigin );
ADDRLP4 520+12
ADDRLP4 368
INDIRB
ASGNB 12
line 793
;792:
;793:	UI_PositionRotatedEntityOnTag( &torso, &legs, pi->legsModel, "tag_torso");
ADDRLP4 520
ARGP4
ADDRLP4 380
ARGP4
ADDRFP4 16
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $358
ARGP4
ADDRGP4 UI_PositionRotatedEntityOnTag
CALLV
pop
line 795
;794:
;795:	torso.renderfx = renderfx;
ADDRLP4 520+4
ADDRLP4 800
INDIRI4
ASGNI4
line 797
;796:
;797:	trap_R_AddRefEntityToScene( &torso );
ADDRLP4 520
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 802
;798:
;799:	//
;800:	// add the head
;801:	//
;802:	head.hModel = pi->headModel;
ADDRLP4 660+8
ADDRFP4 16
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 803
;803:	if (!head.hModel) {
ADDRLP4 660+8
INDIRI4
CNSTI4 0
NEI4 $361
line 804
;804:		return;
ADDRGP4 $299
JUMPV
LABELV $361
line 806
;805:	}
;806:	head.customSkin = pi->headSkin;
ADDRLP4 660+108
ADDRFP4 16
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ASGNI4
line 808
;807:
;808:	VectorCopy( origin, head.lightingOrigin );
ADDRLP4 660+12
ADDRLP4 368
INDIRB
ASGNB 12
line 810
;809:
;810:	UI_PositionRotatedEntityOnTag( &head, &torso, pi->torsoModel, "tag_head");
ADDRLP4 660
ARGP4
ADDRLP4 520
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRGP4 $366
ARGP4
ADDRGP4 UI_PositionRotatedEntityOnTag
CALLV
pop
line 812
;811:
;812:	head.renderfx = renderfx;
ADDRLP4 660+4
ADDRLP4 800
INDIRI4
ASGNI4
line 814
;813:
;814:	trap_R_AddRefEntityToScene( &head );
ADDRLP4 660
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 819
;815:
;816:	//
;817:	// add the gun
;818:	//
;819:	if ( pi->currentWeapon != WP_NONE ) {
ADDRFP4 16
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
EQI4 $368
line 820
;820:		memset( &gun, 0, sizeof(gun) );
ADDRLP4 804
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 821
;821:		gun.hModel = pi->weaponModel;
ADDRLP4 804+8
ADDRFP4 16
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
ASGNI4
line 822
;822:		VectorCopy( origin, gun.lightingOrigin );
ADDRLP4 804+12
ADDRLP4 368
INDIRB
ASGNB 12
line 823
;823:		UI_PositionEntityOnTag( &gun, &torso, pi->torsoModel, "tag_weapon");
ADDRLP4 804
ARGP4
ADDRLP4 520
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRGP4 $372
ARGP4
ADDRGP4 UI_PositionEntityOnTag
CALLV
pop
line 824
;824:		gun.renderfx = renderfx;
ADDRLP4 804+4
ADDRLP4 800
INDIRI4
ASGNI4
line 825
;825:		trap_R_AddRefEntityToScene( &gun );
ADDRLP4 804
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 826
;826:	}
LABELV $368
line 831
;827:
;828:	//
;829:	// add the spinning barrel
;830:	//
;831:	if ( pi->realWeapon == WP_MACHINEGUN || pi->realWeapon == WP_GAUNTLET || pi->realWeapon == WP_BFG ) {
ADDRLP4 1280
ADDRFP4 16
INDIRP4
CNSTI4 1104
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1280
INDIRI4
CNSTI4 2
EQI4 $377
ADDRLP4 1280
INDIRI4
CNSTI4 1
EQI4 $377
ADDRLP4 1280
INDIRI4
CNSTI4 9
NEI4 $374
LABELV $377
line 834
;832:		vec3_t	angles;
;833:
;834:		memset( &barrel, 0, sizeof(barrel) );
ADDRLP4 944
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 835
;835:		VectorCopy( origin, barrel.lightingOrigin );
ADDRLP4 944+12
ADDRLP4 368
INDIRB
ASGNB 12
line 836
;836:		barrel.renderfx = renderfx;
ADDRLP4 944+4
ADDRLP4 800
INDIRI4
ASGNI4
line 838
;837:
;838:		barrel.hModel = pi->barrelModel;
ADDRLP4 944+8
ADDRFP4 16
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
ASGNI4
line 839
;839:		angles[YAW] = 0;
ADDRLP4 1284+4
CNSTF4 0
ASGNF4
line 840
;840:		angles[PITCH] = 0;
ADDRLP4 1284
CNSTF4 0
ASGNF4
line 841
;841:		angles[ROLL] = UI_MachinegunSpinAngle( pi );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 1296
ADDRGP4 UI_MachinegunSpinAngle
CALLF4
ASGNF4
ADDRLP4 1284+8
ADDRLP4 1296
INDIRF4
ASGNF4
line 842
;842:		if( pi->realWeapon == WP_GAUNTLET || pi->realWeapon == WP_BFG ) {
ADDRLP4 1300
ADDRFP4 16
INDIRP4
CNSTI4 1104
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 1
EQI4 $385
ADDRLP4 1300
INDIRI4
CNSTI4 9
NEI4 $383
LABELV $385
line 843
;843:			angles[PITCH] = angles[ROLL];
ADDRLP4 1284
ADDRLP4 1284+8
INDIRF4
ASGNF4
line 844
;844:			angles[ROLL] = 0;
ADDRLP4 1284+8
CNSTF4 0
ASGNF4
line 845
;845:		}
LABELV $383
line 846
;846:		AnglesToAxis( angles, barrel.axis );
ADDRLP4 1284
ARGP4
ADDRLP4 944+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 848
;847:
;848:		UI_PositionRotatedEntityOnTag( &barrel, &gun, pi->weaponModel, "tag_barrel");
ADDRLP4 944
ARGP4
ADDRLP4 804
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
ARGI4
ADDRGP4 $389
ARGP4
ADDRGP4 UI_PositionRotatedEntityOnTag
CALLV
pop
line 850
;849:
;850:		trap_R_AddRefEntityToScene( &barrel );
ADDRLP4 944
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 851
;851:	}
LABELV $374
line 856
;852:
;853:	//
;854:	// add muzzle flash
;855:	//
;856:	if ( dp_realtime <= pi->muzzleFlashTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 16
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
GTI4 $390
line 857
;857:		if ( pi->flashModel ) {
ADDRFP4 16
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $392
line 858
;858:			memset( &flash, 0, sizeof(flash) );
ADDRLP4 1108
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 859
;859:			flash.hModel = pi->flashModel;
ADDRLP4 1108+8
ADDRFP4 16
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ASGNI4
line 860
;860:			VectorCopy( origin, flash.lightingOrigin );
ADDRLP4 1108+12
ADDRLP4 368
INDIRB
ASGNB 12
line 861
;861:			UI_PositionEntityOnTag( &flash, &gun, pi->weaponModel, "tag_flash");
ADDRLP4 1108
ARGP4
ADDRLP4 804
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
ARGI4
ADDRGP4 $396
ARGP4
ADDRGP4 UI_PositionEntityOnTag
CALLV
pop
line 862
;862:			flash.renderfx = renderfx;
ADDRLP4 1108+4
ADDRLP4 800
INDIRI4
ASGNI4
line 863
;863:			trap_R_AddRefEntityToScene( &flash );
ADDRLP4 1108
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 864
;864:		}
LABELV $392
line 867
;865:
;866:		// make a dlight for the flash
;867:		if ( pi->flashDlightColor[0] || pi->flashDlightColor[1] || pi->flashDlightColor[2] ) {
ADDRLP4 1284
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1288
CNSTF4 0
ASGNF4
ADDRLP4 1284
INDIRP4
CNSTI4 1000
ADDP4
INDIRF4
ADDRLP4 1288
INDIRF4
NEF4 $401
ADDRLP4 1284
INDIRP4
CNSTI4 1004
ADDP4
INDIRF4
ADDRLP4 1288
INDIRF4
NEF4 $401
ADDRLP4 1284
INDIRP4
CNSTI4 1008
ADDP4
INDIRF4
ADDRLP4 1288
INDIRF4
EQF4 $398
LABELV $401
line 868
;868:			trap_R_AddLightToScene( flash.origin, 200 + (rand()&31), pi->flashDlightColor[0],
ADDRLP4 1292
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1108+68
ARGP4
ADDRLP4 1292
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 1296
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1296
INDIRP4
CNSTI4 1000
ADDP4
INDIRF4
ARGF4
ADDRLP4 1296
INDIRP4
CNSTI4 1004
ADDP4
INDIRF4
ARGF4
ADDRLP4 1296
INDIRP4
CNSTI4 1008
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 870
;869:				pi->flashDlightColor[1], pi->flashDlightColor[2] );
;870:		}
LABELV $398
line 871
;871:	}
LABELV $390
line 876
;872:
;873:	//
;874:	// add the chat icon
;875:	//
;876:	if ( pi->chat ) {
ADDRFP4 16
INDIRP4
CNSTI4 1084
ADDP4
INDIRI4
CNSTI4 0
EQI4 $403
line 877
;877:		UI_PlayerFloatSprite( pi, origin, trap_R_RegisterShaderNoMip( "sprites/balloon3" ) );
ADDRGP4 $405
ARGP4
ADDRLP4 1284
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 368
ARGP4
ADDRLP4 1284
INDIRI4
ARGI4
ADDRGP4 UI_PlayerFloatSprite
CALLV
pop
line 878
;878:	}
LABELV $403
line 883
;879:
;880:	//
;881:	// add an accent light
;882:	//
;883:	origin[0] -= 100;	// + = behind, - = in front
ADDRLP4 368
ADDRLP4 368
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 884
;884:	origin[1] += 100;	// + = left, - = right
ADDRLP4 368+4
ADDRLP4 368+4
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 885
;885:	origin[2] += 100;	// + = above, - = below
ADDRLP4 368+8
ADDRLP4 368+8
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 886
;886:	trap_R_AddLightToScene( origin, 500, 1.0, 1.0, 1.0 );
ADDRLP4 368
ARGP4
CNSTF4 1140457472
ARGF4
ADDRLP4 1284
CNSTF4 1065353216
ASGNF4
ADDRLP4 1284
INDIRF4
ARGF4
ADDRLP4 1284
INDIRF4
ARGF4
ADDRLP4 1284
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 888
;887:
;888:	origin[0] -= 100;
ADDRLP4 368
ADDRLP4 368
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 889
;889:	origin[1] -= 100;
ADDRLP4 368+4
ADDRLP4 368+4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 890
;890:	origin[2] -= 100;
ADDRLP4 368+8
ADDRLP4 368+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 891
;891:	trap_R_AddLightToScene( origin, 500, 1.0, 0.0, 0.0 );
ADDRLP4 368
ARGP4
CNSTF4 1140457472
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1288
CNSTF4 0
ASGNF4
ADDRLP4 1288
INDIRF4
ARGF4
ADDRLP4 1288
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 893
;892:
;893:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 894
;894:}
LABELV $299
endproc UI_DrawPlayer 1304 28
proc UI_RegisterClientSkin 84 20
line 902
;895:
;896:
;897:/*
;898:==========================
;899:UI_RegisterClientSkin
;900:==========================
;901:*/
;902:static qboolean UI_RegisterClientSkin( playerInfo_t *pi, const char *modelName, const char *skinName ) {
line 905
;903:	char		filename[MAX_QPATH];
;904:
;905:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $411
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 906
;906:	pi->legsSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 908
;907:
;908:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $412
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 909
;909:	pi->torsoSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 911
;910:
;911:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/head_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $413
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 912
;912:	pi->headSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 914
;913:
;914:	if ( !pi->legsSkin || !pi->torsoSkin || !pi->headSkin ) {
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $417
ADDRLP4 76
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $417
ADDRLP4 76
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $414
LABELV $417
line 915
;915:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $410
JUMPV
LABELV $414
line 918
;916:	}
;917:
;918:	return qtrue;
CNSTI4 1
RETI4
LABELV $410
endproc UI_RegisterClientSkin 84 20
proc UI_ParseAnimationFile 20068 12
line 927
;919:}
;920:
;921:
;922:/*
;923:======================
;924:UI_ParseAnimationFile
;925:======================
;926:*/
;927:static qboolean UI_ParseAnimationFile( const char *filename, animation_t *animations ) {
line 937
;928:	char		*text_p, *prev;
;929:	int			len;
;930:	int			i;
;931:	char		*token;
;932:	float		fps;
;933:	int			skip;
;934:	char		text[20000];
;935:	fileHandle_t	f;
;936:
;937:	memset( animations, 0, sizeof( animation_t ) * MAX_ANIMATIONS );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 868
ARGI4
ADDRGP4 memset
CALLP4
pop
line 940
;938:
;939:	// load the file
;940:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20028
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20032
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 20032
INDIRI4
ASGNI4
line 941
;941:	if ( len <= 0 ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
GTI4 $419
line 942
;942:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $418
JUMPV
LABELV $419
line 944
;943:	}
;944:	if ( len >= ( sizeof( text ) - 1 ) ) {
ADDRLP4 24
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $421
line 945
;945:		Com_Printf( "File %s too long\n", filename );
ADDRGP4 $423
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 946
;946:		trap_FS_FCloseFile( f );
ADDRLP4 20028
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 947
;947:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $418
JUMPV
LABELV $421
line 949
;948:	}
;949:	trap_FS_Read( text, len, f );
ADDRLP4 28
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 20028
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 950
;950:	text[len] = 0;
ADDRLP4 24
INDIRI4
ADDRLP4 28
ADDP4
CNSTI1 0
ASGNI1
line 951
;951:	trap_FS_FCloseFile( f );
ADDRLP4 20028
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 954
;952:
;953:	// parse the text
;954:	text_p = text;
ADDRLP4 8
ADDRLP4 28
ASGNP4
line 955
;955:	skip = 0;	// quite the compiler warning
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $425
JUMPV
LABELV $424
line 958
;956:
;957:	// read optional parameters
;958:	while ( 1 ) {
line 959
;959:		prev = text_p;	// so we can unget
ADDRLP4 16
ADDRLP4 8
INDIRP4
ASGNP4
line 960
;960:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20036
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20036
INDIRP4
ASGNP4
line 961
;961:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $427
line 962
;962:			break;
ADDRGP4 $426
JUMPV
LABELV $427
line 964
;963:		}
;964:		if ( !Q_stricmp( token, "footsteps" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $431
ARGP4
ADDRLP4 20040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20040
INDIRI4
CNSTI4 0
NEI4 $429
line 965
;965:			token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20044
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20044
INDIRP4
ASGNP4
line 966
;966:			if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $425
line 967
;967:				break;
ADDRGP4 $426
JUMPV
line 969
;968:			}
;969:			continue;
LABELV $429
line 970
;970:		} else if ( !Q_stricmp( token, "headoffset" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 20044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20044
INDIRI4
CNSTI4 0
NEI4 $434
line 971
;971:			for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $437
line 972
;972:				token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 973
;973:				if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $441
line 974
;974:					break;
ADDRGP4 $425
JUMPV
LABELV $441
line 976
;975:				}
;976:			}
LABELV $438
line 971
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $437
line 977
;977:			continue;
ADDRGP4 $425
JUMPV
LABELV $434
line 978
;978:		} else if ( !Q_stricmp( token, "sex" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $445
ARGP4
ADDRLP4 20048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20048
INDIRI4
CNSTI4 0
NEI4 $443
line 979
;979:			token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 980
;980:			if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $425
line 981
;981:				break;
ADDRGP4 $426
JUMPV
line 983
;982:			}
;983:			continue;
LABELV $443
line 987
;984:		}
;985:
;986:		// if it is a number, start parsing animations
;987:		if ( token[0] >= '0' && token[0] <= '9' ) {
ADDRLP4 20052
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 48
LTI4 $448
ADDRLP4 20052
INDIRI4
CNSTI4 57
GTI4 $448
line 988
;988:			text_p = prev;	// unget the token
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 989
;989:			break;
ADDRGP4 $426
JUMPV
LABELV $448
line 992
;990:		}
;991:
;992:		Com_Printf( "unknown token '%s' is %s\n", token, filename );
ADDRGP4 $450
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 993
;993:	}
LABELV $425
line 958
ADDRGP4 $424
JUMPV
LABELV $426
line 996
;994:
;995:	// read information for each frame
;996:	for ( i = 0 ; i < MAX_ANIMATIONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $451
line 998
;997:
;998:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20036
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20036
INDIRP4
ASGNP4
line 999
;999:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $455
line 1000
;1000:			break;
ADDRGP4 $453
JUMPV
LABELV $455
line 1002
;1001:		}
;1002:		animations[i].firstFrame = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20040
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 20040
INDIRI4
ASGNI4
line 1004
;1003:		// leg only frames are adjusted to not count the upper body only frames
;1004:		if ( i == LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $457
line 1005
;1005:			skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
ADDRLP4 20044
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 20044
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 20044
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1006
;1006:		}
LABELV $457
line 1007
;1007:		if ( i >= LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $459
line 1008
;1008:			animations[i].firstFrame -= skip;
ADDRLP4 20044
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20044
INDIRP4
ADDRLP4 20044
INDIRP4
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1009
;1009:		}
LABELV $459
line 1011
;1010:
;1011:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20044
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20044
INDIRP4
ASGNP4
line 1012
;1012:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $461
line 1013
;1013:			break;
ADDRGP4 $453
JUMPV
LABELV $461
line 1015
;1014:		}
;1015:		animations[i].numFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20048
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20048
INDIRI4
ASGNI4
line 1017
;1016:
;1017:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 1018
;1018:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $463
line 1019
;1019:			break;
ADDRGP4 $453
JUMPV
LABELV $463
line 1021
;1020:		}
;1021:		animations[i].loopFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20056
INDIRI4
ASGNI4
line 1023
;1022:
;1023:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 1024
;1024:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $465
line 1025
;1025:			break;
ADDRGP4 $453
JUMPV
LABELV $465
line 1027
;1026:		}
;1027:		fps = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 20064
INDIRF4
ASGNF4
line 1028
;1028:		if ( fps == 0 ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
NEF4 $467
line 1029
;1029:			fps = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1030
;1030:		}
LABELV $467
line 1031
;1031:		animations[i].frameLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 12
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1032
;1032:		animations[i].initialLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 12
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1033
;1033:	}
LABELV $452
line 996
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $451
LABELV $453
line 1035
;1034:
;1035:	if ( i != MAX_ANIMATIONS ) {
ADDRLP4 4
INDIRI4
CNSTI4 31
EQI4 $469
line 1036
;1036:		Com_Printf( "Error parsing animation file: %s\n", filename );
ADDRGP4 $471
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1037
;1037:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $418
JUMPV
LABELV $469
line 1040
;1038:	}
;1039:
;1040:	return qtrue;
CNSTI4 1
RETI4
LABELV $418
endproc UI_ParseAnimationFile 20068 12
export UI_RegisterClientModelname
proc UI_RegisterClientModelname 220 16
line 1049
;1041:}
;1042:
;1043:
;1044:/*
;1045:==========================
;1046:UI_RegisterClientModelname
;1047:==========================
;1048:*/
;1049:qboolean UI_RegisterClientModelname( playerInfo_t *pi, const char *modelSkinName ) {
line 1055
;1050:	char		modelName[MAX_QPATH];
;1051:	char		skinName[MAX_QPATH];
;1052:	char		filename[MAX_QPATH];
;1053:	char		*slash;
;1054:
;1055:	pi->torsoModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTI4 0
ASGNI4
line 1056
;1056:	pi->headModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTI4 0
ASGNI4
line 1058
;1057:
;1058:	if ( !modelSkinName[0] ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $473
line 1059
;1059:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $473
line 1062
;1060:	}
;1061:
;1062:	Q_strncpyz( modelName, modelSkinName, sizeof( modelName ) );
ADDRLP4 64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1064
;1063:
;1064:	slash = strchr( modelName, '/' );
ADDRLP4 64
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 196
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 192
ADDRLP4 196
INDIRP4
ASGNP4
line 1065
;1065:	if ( !slash ) {
ADDRLP4 192
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $475
line 1067
;1066:		// modelName did not include a skin name
;1067:		Q_strncpyz( skinName, "default", sizeof( skinName ) );
ADDRLP4 128
ARGP4
ADDRGP4 $477
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1068
;1068:	} else {
ADDRGP4 $476
JUMPV
LABELV $475
line 1069
;1069:		Q_strncpyz( skinName, slash + 1, sizeof( skinName ) );
ADDRLP4 128
ARGP4
ADDRLP4 192
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1071
;1070:		// truncate modelName
;1071:		*slash = 0;
ADDRLP4 192
INDIRP4
CNSTI1 0
ASGNI1
line 1072
;1072:	}
LABELV $476
line 1076
;1073:
;1074:	// load cmodels before models so filecache works
;1075:
;1076:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $478
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1077
;1077:	pi->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 200
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 200
INDIRI4
ASGNI4
line 1078
;1078:	if ( !pi->legsModel ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $479
line 1079
;1079:		Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $481
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1080
;1080:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $479
line 1083
;1081:	}
;1082:
;1083:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $482
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1084
;1084:	pi->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 204
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 204
INDIRI4
ASGNI4
line 1085
;1085:	if ( !pi->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
NEI4 $483
line 1086
;1086:		Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $481
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1087
;1087:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $483
line 1090
;1088:	}
;1089:
;1090:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/head.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $485
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1091
;1091:	pi->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 208
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 208
INDIRI4
ASGNI4
line 1092
;1092:	if ( !pi->headModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 0
NEI4 $486
line 1093
;1093:		Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $481
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1094
;1094:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $486
line 1098
;1095:	}
;1096:
;1097:	// if any skins failed to load, fall back to default
;1098:	if ( !UI_RegisterClientSkin( pi, modelName, skinName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 212
ADDRGP4 UI_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 0
NEI4 $488
line 1099
;1099:		if ( !UI_RegisterClientSkin( pi, modelName, "default" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 $477
ARGP4
ADDRLP4 216
ADDRGP4 UI_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
NEI4 $490
line 1100
;1100:			Com_Printf( "Failed to load skin file: %s : %s\n", modelName, skinName );
ADDRGP4 $492
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1101
;1101:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $490
line 1103
;1102:		}
;1103:	}
LABELV $488
line 1106
;1104:
;1105:	// load the animations
;1106:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $493
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1107
;1107:	if ( !UI_ParseAnimationFile( filename, pi->animations ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ARGP4
ADDRLP4 216
ADDRGP4 UI_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
NEI4 $494
line 1108
;1108:		Com_Printf( "Failed to load animation file %s\n", filename );
ADDRGP4 $496
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1109
;1109:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $494
line 1112
;1110:	}
;1111:
;1112:	return qtrue;
CNSTI4 1
RETI4
LABELV $472
endproc UI_RegisterClientModelname 220 16
export UI_PlayerInfo_SetModel
proc UI_PlayerInfo_SetModel 12 12
line 1121
;1113:}
;1114:
;1115:
;1116:/*
;1117:===============
;1118:UI_PlayerInfo_SetModel
;1119:===============
;1120:*/
;1121:void UI_PlayerInfo_SetModel( playerInfo_t *pi, const char *model ) {
line 1122
;1122:	memset( pi, 0, sizeof(*pi) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1108
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1123
;1123:	UI_RegisterClientModelname( pi, model );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 1124
;1124:	pi->weapon = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 1052
ADDP4
CNSTI4 2
ASGNI4
line 1125
;1125:	pi->currentWeapon = pi->weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1040
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
ASGNI4
line 1126
;1126:	pi->lastWeapon = pi->weapon;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1056
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
ASGNI4
line 1127
;1127:	pi->pendingWeapon = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1060
ADDP4
CNSTI4 -1
ASGNI4
line 1128
;1128:	pi->weaponTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1064
ADDP4
CNSTI4 0
ASGNI4
line 1129
;1129:	pi->chat = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1084
ADDP4
CNSTI4 0
ASGNI4
line 1130
;1130:	pi->newModel = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1088
ADDP4
CNSTI4 1
ASGNI4
line 1131
;1131:	UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 1132
;1132:}
LABELV $497
endproc UI_PlayerInfo_SetModel 12 12
export UI_PlayerInfo_SetInfo
proc UI_PlayerInfo_SetInfo 36 8
line 1140
;1133:
;1134:
;1135:/*
;1136:===============
;1137:UI_PlayerInfo_SetInfo
;1138:===============
;1139:*/
;1140:void UI_PlayerInfo_SetInfo( playerInfo_t *pi, int legsAnim, int torsoAnim, vec3_t viewAngles, vec3_t moveAngles, weapon_t weaponNumber, qboolean chat ) {
line 1144
;1141:	int			currentAnim;
;1142:	weapon_t	weaponNum;
;1143:
;1144:	pi->chat = chat;
ADDRFP4 0
INDIRP4
CNSTI4 1084
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 1147
;1145:
;1146:	// view angles
;1147:	VectorCopy( viewAngles, pi->viewAngles );
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1150
;1148:
;1149:	// move angles
;1150:	VectorCopy( moveAngles, pi->moveAngles );
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
ADDRFP4 16
INDIRP4
INDIRB
ASGNB 12
line 1152
;1151:
;1152:	if ( pi->newModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 1088
ADDP4
INDIRI4
CNSTI4 0
EQI4 $499
line 1153
;1153:		pi->newModel = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1088
ADDP4
CNSTI4 0
ASGNI4
line 1155
;1154:
;1155:		jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 1156
;1156:		pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
CNSTI4 0
ASGNI4
line 1157
;1157:		UI_ForceLegsAnim( pi, legsAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 1158
;1158:		pi->legs.yawAngle = viewAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1159
;1159:		pi->legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 0
ASGNI4
line 1161
;1160:
;1161:		pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
CNSTI4 0
ASGNI4
line 1162
;1162:		UI_ForceTorsoAnim( pi, torsoAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 1163
;1163:		pi->torso.yawAngle = viewAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1164
;1164:		pi->torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1166
;1165:
;1166:		if ( weaponNumber != -1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 -1
EQI4 $498
line 1167
;1167:			pi->weapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1052
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1168
;1168:			pi->currentWeapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1169
;1169:			pi->lastWeapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1056
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1170
;1170:			pi->pendingWeapon = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1060
ADDP4
CNSTI4 -1
ASGNI4
line 1171
;1171:			pi->weaponTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1064
ADDP4
CNSTI4 0
ASGNI4
line 1172
;1172:			UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 1173
;1173:		}
line 1175
;1174:
;1175:		return;
ADDRGP4 $498
JUMPV
LABELV $499
line 1179
;1176:	}
;1177:
;1178:	// weapon
;1179:	if ( weaponNumber == -1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 -1
NEI4 $503
line 1180
;1180:		pi->pendingWeapon = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1060
ADDP4
CNSTI4 -1
ASGNI4
line 1181
;1181:		pi->weaponTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1064
ADDP4
CNSTI4 0
ASGNI4
line 1182
;1182:	}
ADDRGP4 $504
JUMPV
LABELV $503
line 1183
;1183:	else if ( weaponNumber != WP_NONE ) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $505
line 1184
;1184:		pi->pendingWeapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1060
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1185
;1185:		pi->weaponTimer = dp_realtime + UI_TIMER_WEAPON_DELAY;
ADDRFP4 0
INDIRP4
CNSTI4 1064
ADDP4
ADDRGP4 dp_realtime
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 1186
;1186:	}
LABELV $505
LABELV $504
line 1187
;1187:	weaponNum = pi->lastWeapon;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
ASGNI4
line 1188
;1188:	pi->weapon = weaponNum;
ADDRFP4 0
INDIRP4
CNSTI4 1052
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1190
;1189:
;1190:	if ( torsoAnim == BOTH_DEATH1 || legsAnim == BOTH_DEATH1 ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $509
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $507
LABELV $509
line 1191
;1191:		torsoAnim = legsAnim = BOTH_DEATH1;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1192
;1192:		pi->weapon = pi->currentWeapon = WP_NONE;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 1040
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 1052
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1193
;1193:		UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 1195
;1194:
;1195:		jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 1196
;1196:		pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
CNSTI4 0
ASGNI4
line 1197
;1197:		UI_ForceLegsAnim( pi, legsAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 1199
;1198:
;1199:		pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
CNSTI4 0
ASGNI4
line 1200
;1200:		UI_ForceTorsoAnim( pi, torsoAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 1202
;1201:
;1202:		return;
ADDRGP4 $498
JUMPV
LABELV $507
line 1206
;1203:	}
;1204:
;1205:	// leg animation
;1206:	currentAnim = pi->legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1207
;1207:	if ( legsAnim != LEGS_JUMP && ( currentAnim == LEGS_JUMP || currentAnim == LEGS_LAND ) ) {
ADDRLP4 12
CNSTI4 18
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $510
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $512
ADDRLP4 0
INDIRI4
CNSTI4 19
NEI4 $510
LABELV $512
line 1208
;1208:		pi->pendingLegsAnim = legsAnim;
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1209
;1209:	}
ADDRGP4 $511
JUMPV
LABELV $510
line 1210
;1210:	else if ( legsAnim != currentAnim ) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $513
line 1211
;1211:		jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 1212
;1212:		pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
CNSTI4 0
ASGNI4
line 1213
;1213:		UI_ForceLegsAnim( pi, legsAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 1214
;1214:	}
LABELV $513
LABELV $511
line 1217
;1215:
;1216:	// torso animation
;1217:	if ( torsoAnim == TORSO_STAND || torsoAnim == TORSO_STAND2 ) {
ADDRLP4 20
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 11
EQI4 $517
ADDRLP4 20
INDIRI4
CNSTI4 12
NEI4 $515
LABELV $517
line 1218
;1218:		if ( weaponNum == WP_NONE || weaponNum == WP_GAUNTLET ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $520
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $518
LABELV $520
line 1219
;1219:			torsoAnim = TORSO_STAND2;
ADDRFP4 8
CNSTI4 12
ASGNI4
line 1220
;1220:		}
ADDRGP4 $519
JUMPV
LABELV $518
line 1221
;1221:		else {
line 1222
;1222:			torsoAnim = TORSO_STAND;
ADDRFP4 8
CNSTI4 11
ASGNI4
line 1223
;1223:		}
LABELV $519
line 1224
;1224:	}
LABELV $515
line 1226
;1225:
;1226:	if ( torsoAnim == TORSO_ATTACK || torsoAnim == TORSO_ATTACK2 ) {
ADDRLP4 24
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 7
EQI4 $523
ADDRLP4 24
INDIRI4
CNSTI4 8
NEI4 $521
LABELV $523
line 1227
;1227:		if ( weaponNum == WP_NONE || weaponNum == WP_GAUNTLET ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $526
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $524
LABELV $526
line 1228
;1228:			torsoAnim = TORSO_ATTACK2;
ADDRFP4 8
CNSTI4 8
ASGNI4
line 1229
;1229:		}
ADDRGP4 $525
JUMPV
LABELV $524
line 1230
;1230:		else {
line 1231
;1231:			torsoAnim = TORSO_ATTACK;
ADDRFP4 8
CNSTI4 7
ASGNI4
line 1232
;1232:		}
LABELV $525
line 1233
;1233:		pi->muzzleFlashTime = dp_realtime + UI_TIMER_MUZZLE_FLASH;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
ADDRGP4 dp_realtime
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1235
;1234:		//FIXME play firing sound here
;1235:	}
LABELV $521
line 1237
;1236:
;1237:	currentAnim = pi->torsoAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1239
;1238:
;1239:	if ( weaponNum != pi->currentWeapon || currentAnim == TORSO_RAISE || currentAnim == TORSO_DROP ) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
NEI4 $530
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $530
ADDRLP4 0
INDIRI4
CNSTI4 9
NEI4 $527
LABELV $530
line 1240
;1240:		pi->pendingTorsoAnim = torsoAnim;
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1241
;1241:	}
ADDRGP4 $528
JUMPV
LABELV $527
line 1242
;1242:	else if ( ( currentAnim == TORSO_GESTURE || currentAnim == TORSO_ATTACK ) && ( torsoAnim != currentAnim ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 6
EQI4 $533
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $531
LABELV $533
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $531
line 1243
;1243:		pi->pendingTorsoAnim = torsoAnim;
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1244
;1244:	}
ADDRGP4 $532
JUMPV
LABELV $531
line 1245
;1245:	else if ( torsoAnim != currentAnim ) {
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $534
line 1246
;1246:		pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
CNSTI4 0
ASGNI4
line 1247
;1247:		UI_ForceTorsoAnim( pi, torsoAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 1248
;1248:	}
LABELV $534
LABELV $532
LABELV $528
line 1249
;1249:}
LABELV $498
endproc UI_PlayerInfo_SetInfo 36 8
bss
align 4
LABELV jumpHeight
skip 4
align 4
LABELV dp_realtime
skip 4
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
LABELV $496
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $493
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $492
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $485
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $482
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $481
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $478
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $477
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $471
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $450
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $445
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $436
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $431
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $423
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $413
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $412
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $411
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $405
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $396
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $389
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 114
byte 1 114
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $372
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $366
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $358
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $175
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $102
byte 1 95
byte 1 98
byte 1 97
byte 1 114
byte 1 114
byte 1 101
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0

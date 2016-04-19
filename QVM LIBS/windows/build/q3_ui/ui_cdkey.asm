code
proc UI_CDKeyMenu_Event 8 4
file "../../../code/q3_ui/ui_cdkey.c"
line 66
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
;26:CD KEY MENU
;27:
;28:=======================================================================
;29:*/
;30:
;31:
;32:#include "ui_local.h"
;33:
;34:
;35:#define ART_FRAME		"menu/art/cut_frame"
;36:#define ART_ACCEPT0		"menu/art/accept_0"
;37:#define ART_ACCEPT1		"menu/art/accept_1"	
;38:#define ART_BACK0		"menu/art/back_0"
;39:#define ART_BACK1		"menu/art/back_1"	
;40:
;41:#define ID_CDKEY		10
;42:#define ID_ACCEPT		11
;43:#define ID_BACK			12
;44:
;45:
;46:typedef struct {
;47:	menuframework_s	menu;
;48:
;49:	menutext_s		banner;
;50:	menubitmap_s	frame;
;51:
;52:	menufield_s		cdkey;
;53:
;54:	menubitmap_s	accept;
;55:	menubitmap_s	back;
;56:} cdkeyMenuInfo_t;
;57:
;58:static cdkeyMenuInfo_t	cdkeyMenuInfo;
;59:
;60:
;61:/*
;62:===============
;63:UI_CDKeyMenu_Event
;64:===============
;65:*/
;66:static void UI_CDKeyMenu_Event( void *ptr, int event ) {
line 67
;67:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $81
line 68
;68:		return;
ADDRGP4 $80
JUMPV
LABELV $81
line 71
;69:	}
;70:
;71:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $86
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $95
ADDRGP4 $83
JUMPV
LABELV $86
line 73
;72:	case ID_ACCEPT:
;73:		if( cdkeyMenuInfo.cdkey.field.buffer[0] ) {
ADDRGP4 cdkeyMenuInfo+576+60+12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $87
line 74
;74:			trap_SetCDKey( cdkeyMenuInfo.cdkey.field.buffer );
ADDRGP4 cdkeyMenuInfo+576+60+12
ARGP4
ADDRGP4 trap_SetCDKey
CALLV
pop
line 75
;75:		}
LABELV $87
line 76
;76:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 77
;77:		break;
ADDRGP4 $84
JUMPV
LABELV $95
line 80
;78:
;79:	case ID_BACK:
;80:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 81
;81:		break;
LABELV $83
LABELV $84
line 83
;82:	}
;83:}
LABELV $80
endproc UI_CDKeyMenu_Event 8 4
proc UI_CDKeyMenu_PreValidateKey 24 4
line 91
;84:
;85:
;86:/*
;87:=================
;88:UI_CDKeyMenu_PreValidateKey
;89:=================
;90:*/
;91:static int UI_CDKeyMenu_PreValidateKey( const char *key ) {
line 94
;92:	char	ch;
;93:
;94:	if( strlen( key ) != 16 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
EQI4 $100
line 95
;95:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $96
JUMPV
LABELV $99
line 98
;96:	}
;97:
;98:	while( ( ch = *key++ ) ) {
line 99
;99:		switch( ch ) {
ADDRLP4 8
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
CNSTI4 50
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $100
ADDRLP4 8
INDIRI4
CNSTI4 51
EQI4 $100
ADDRLP4 8
INDIRI4
CNSTI4 55
EQI4 $100
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $102
LABELV $106
ADDRLP4 8
INDIRI4
CNSTI4 97
LTI4 $102
ADDRLP4 8
INDIRI4
CNSTI4 119
GTI4 $102
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $107-388
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $107
address $100
address $100
address $100
address $100
address $102
address $102
address $100
address $100
address $102
address $100
address $102
address $100
address $102
address $102
address $102
address $100
address $102
address $100
address $100
address $100
address $102
address $102
address $100
code
line 116
;100:		case '2':
;101:		case '3':
;102:		case '7':
;103:		case 'a':
;104:		case 'b':
;105:		case 'c':
;106:		case 'd':
;107:		case 'g':
;108:		case 'h':
;109:		case 'j':
;110:		case 'l':
;111:		case 'p':
;112:		case 'r':
;113:		case 's':
;114:		case 't':
;115:		case 'w':
;116:			continue;
LABELV $102
line 118
;117:		default:
;118:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $96
JUMPV
LABELV $100
line 98
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 0
ADDRLP4 12
INDIRI1
ASGNI1
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $99
line 122
;119:		}
;120:	}
;121:
;122:	return 0;
CNSTI4 0
RETI4
LABELV $96
endproc UI_CDKeyMenu_PreValidateKey 24 4
proc UI_CDKeyMenu_DrawKey 44 20
line 131
;123:}
;124:
;125:
;126:/*
;127:=================
;128:UI_CDKeyMenu_DrawKey
;129:=================
;130:*/
;131:static void UI_CDKeyMenu_DrawKey( void *self ) {
line 140
;132:	menufield_s		*f;
;133:	qboolean		focus;
;134:	int				style;
;135:	char			c;
;136:	float			*color;
;137:	int				x, y;
;138:	int				val;
;139:
;140:	f = (menufield_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 142
;141:
;142:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
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
NEI4 $111
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRGP4 $112
JUMPV
LABELV $111
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $112
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 144
;143:
;144:	style = UI_LEFT;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 145
;145:	if( focus ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $113
line 146
;146:		color = color_yellow;
ADDRLP4 24
ADDRGP4 color_yellow
ASGNP4
line 147
;147:	}
ADDRGP4 $114
JUMPV
LABELV $113
line 148
;148:	else {
line 149
;149:		color = color_orange;
ADDRLP4 24
ADDRGP4 color_orange
ASGNP4
line 150
;150:	}
LABELV $114
line 152
;151:
;152:	x = 320 - 8 * BIGCHAR_WIDTH;
ADDRLP4 8
CNSTI4 192
ASGNI4
line 153
;153:	y = 240 - BIGCHAR_HEIGHT / 2;
ADDRLP4 12
CNSTI4 232
ASGNI4
line 154
;154:	UI_FillRect( x, y, 16 * BIGCHAR_WIDTH, BIGCHAR_HEIGHT, listbar_color );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1132462080
ARGF4
CNSTF4 1098907648
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 155
;155:	UI_DrawString( x, y, f->field.buffer, style, color );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 158
;156:
;157:	// draw cursor if we have focus
;158:	if( focus ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $115
line 159
;159:		if ( trap_Key_GetOverstrikeMode() ) {
ADDRLP4 40
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $117
line 160
;160:			c = 11;
ADDRLP4 28
CNSTI1 11
ASGNI1
line 161
;161:		} else {
ADDRGP4 $118
JUMPV
LABELV $117
line 162
;162:			c = 10;
ADDRLP4 28
CNSTI1 10
ASGNI1
line 163
;163:		}
LABELV $118
line 165
;164:
;165:		style &= ~UI_PULSE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 166
;166:		style |= UI_BLINK;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 168
;167:
;168:		UI_DrawChar( x + f->field.cursor * BIGCHAR_WIDTH, y, c, style, color_white );
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 28
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 169
;169:	}
LABELV $115
line 171
;170:
;171:	val = UI_CDKeyMenu_PreValidateKey( f->field.buffer );
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 UI_CDKeyMenu_PreValidateKey
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
ASGNI4
line 172
;172:	if( val == 1 ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
NEI4 $119
line 173
;173:		UI_DrawProportionalString( 320, 376, "Please enter your CD Key", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 376
ARGI4
ADDRGP4 $121
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 174
;174:	}
ADDRGP4 $120
JUMPV
LABELV $119
line 175
;175:	else if ( val == 0 ) {
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $122
line 176
;176:		UI_DrawProportionalString( 320, 376, "The CD Key appears to be valid, thank you", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
CNSTI4 376
ARGI4
ADDRGP4 $124
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 177
;177:	}
ADDRGP4 $123
JUMPV
LABELV $122
line 178
;178:	else {
line 179
;179:		UI_DrawProportionalString( 320, 376, "The CD Key is not valid", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 376
ARGI4
ADDRGP4 $125
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 180
;180:	}
LABELV $123
LABELV $120
line 181
;181:}
LABELV $109
endproc UI_CDKeyMenu_DrawKey 44 20
proc UI_CDKeyMenu_Init 4 12
line 189
;182:
;183:
;184:/*
;185:===============
;186:UI_CDKeyMenu_Init
;187:===============
;188:*/
;189:static void UI_CDKeyMenu_Init( void ) {
line 190
;190:	trap_Cvar_Set( "ui_cdkeychecked", "1" );
ADDRGP4 $127
ARGP4
ADDRGP4 $128
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 192
;191:
;192:	UI_CDKeyMenu_Cache();
ADDRGP4 UI_CDKeyMenu_Cache
CALLV
pop
line 194
;193:
;194:	memset( &cdkeyMenuInfo, 0, sizeof(cdkeyMenuInfo) );
ADDRGP4 cdkeyMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1084
ARGI4
ADDRGP4 memset
CALLP4
pop
line 195
;195:	cdkeyMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 cdkeyMenuInfo+404
CNSTI4 1
ASGNI4
line 196
;196:	cdkeyMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 cdkeyMenuInfo+408
CNSTI4 1
ASGNI4
line 198
;197:
;198:	cdkeyMenuInfo.banner.generic.type				= MTYPE_BTEXT;
ADDRGP4 cdkeyMenuInfo+416
CNSTI4 10
ASGNI4
line 199
;199:	cdkeyMenuInfo.banner.generic.x					= 320;
ADDRGP4 cdkeyMenuInfo+416+12
CNSTI4 320
ASGNI4
line 200
;200:	cdkeyMenuInfo.banner.generic.y					= 16;
ADDRGP4 cdkeyMenuInfo+416+16
CNSTI4 16
ASGNI4
line 201
;201:	cdkeyMenuInfo.banner.string						= "CD KEY";
ADDRGP4 cdkeyMenuInfo+416+60
ADDRGP4 $138
ASGNP4
line 202
;202:	cdkeyMenuInfo.banner.color						= color_white;
ADDRGP4 cdkeyMenuInfo+416+68
ADDRGP4 color_white
ASGNP4
line 203
;203:	cdkeyMenuInfo.banner.style						= UI_CENTER;
ADDRGP4 cdkeyMenuInfo+416+64
CNSTI4 1
ASGNI4
line 205
;204:
;205:	cdkeyMenuInfo.frame.generic.type				= MTYPE_BITMAP;
ADDRGP4 cdkeyMenuInfo+488
CNSTI4 6
ASGNI4
line 206
;206:	cdkeyMenuInfo.frame.generic.name				= ART_FRAME;
ADDRGP4 cdkeyMenuInfo+488+4
ADDRGP4 $146
ASGNP4
line 207
;207:	cdkeyMenuInfo.frame.generic.flags				= QMF_INACTIVE;
ADDRGP4 cdkeyMenuInfo+488+44
CNSTU4 16384
ASGNU4
line 208
;208:	cdkeyMenuInfo.frame.generic.x					= 142;
ADDRGP4 cdkeyMenuInfo+488+12
CNSTI4 142
ASGNI4
line 209
;209:	cdkeyMenuInfo.frame.generic.y					= 118;
ADDRGP4 cdkeyMenuInfo+488+16
CNSTI4 118
ASGNI4
line 210
;210:	cdkeyMenuInfo.frame.width  						= 359;
ADDRGP4 cdkeyMenuInfo+488+76
CNSTI4 359
ASGNI4
line 211
;211:	cdkeyMenuInfo.frame.height  					= 256;
ADDRGP4 cdkeyMenuInfo+488+80
CNSTI4 256
ASGNI4
line 213
;212:
;213:	cdkeyMenuInfo.cdkey.generic.type				= MTYPE_FIELD;
ADDRGP4 cdkeyMenuInfo+576
CNSTI4 4
ASGNI4
line 214
;214:	cdkeyMenuInfo.cdkey.generic.name				= "CD Key:";
ADDRGP4 cdkeyMenuInfo+576+4
ADDRGP4 $160
ASGNP4
line 215
;215:	cdkeyMenuInfo.cdkey.generic.flags				= QMF_LOWERCASE;
ADDRGP4 cdkeyMenuInfo+576+44
CNSTU4 262144
ASGNU4
line 216
;216:	cdkeyMenuInfo.cdkey.generic.x					= 320 - BIGCHAR_WIDTH * 2.5;
ADDRGP4 cdkeyMenuInfo+576+12
CNSTI4 280
ASGNI4
line 217
;217:	cdkeyMenuInfo.cdkey.generic.y					= 240 - BIGCHAR_HEIGHT / 2;
ADDRGP4 cdkeyMenuInfo+576+16
CNSTI4 232
ASGNI4
line 218
;218:	cdkeyMenuInfo.cdkey.field.widthInChars			= 16;
ADDRGP4 cdkeyMenuInfo+576+60+8
CNSTI4 16
ASGNI4
line 219
;219:	cdkeyMenuInfo.cdkey.field.maxchars				= 16;
ADDRGP4 cdkeyMenuInfo+576+60+268
CNSTI4 16
ASGNI4
line 220
;220:	cdkeyMenuInfo.cdkey.generic.ownerdraw			= UI_CDKeyMenu_DrawKey;
ADDRGP4 cdkeyMenuInfo+576+56
ADDRGP4 UI_CDKeyMenu_DrawKey
ASGNP4
line 222
;221:
;222:	cdkeyMenuInfo.accept.generic.type				= MTYPE_BITMAP;
ADDRGP4 cdkeyMenuInfo+908
CNSTI4 6
ASGNI4
line 223
;223:	cdkeyMenuInfo.accept.generic.name				= ART_ACCEPT0;
ADDRGP4 cdkeyMenuInfo+908+4
ADDRGP4 $178
ASGNP4
line 224
;224:	cdkeyMenuInfo.accept.generic.flags				= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cdkeyMenuInfo+908+44
CNSTU4 272
ASGNU4
line 225
;225:	cdkeyMenuInfo.accept.generic.id					= ID_ACCEPT;
ADDRGP4 cdkeyMenuInfo+908+8
CNSTI4 11
ASGNI4
line 226
;226:	cdkeyMenuInfo.accept.generic.callback			= UI_CDKeyMenu_Event;
ADDRGP4 cdkeyMenuInfo+908+48
ADDRGP4 UI_CDKeyMenu_Event
ASGNP4
line 227
;227:	cdkeyMenuInfo.accept.generic.x					= 640;
ADDRGP4 cdkeyMenuInfo+908+12
CNSTI4 640
ASGNI4
line 228
;228:	cdkeyMenuInfo.accept.generic.y					= 480-64;
ADDRGP4 cdkeyMenuInfo+908+16
CNSTI4 416
ASGNI4
line 229
;229:	cdkeyMenuInfo.accept.width						= 128;
ADDRGP4 cdkeyMenuInfo+908+76
CNSTI4 128
ASGNI4
line 230
;230:	cdkeyMenuInfo.accept.height						= 64;
ADDRGP4 cdkeyMenuInfo+908+80
CNSTI4 64
ASGNI4
line 231
;231:	cdkeyMenuInfo.accept.focuspic					= ART_ACCEPT1;
ADDRGP4 cdkeyMenuInfo+908+60
ADDRGP4 $195
ASGNP4
line 233
;232:
;233:	cdkeyMenuInfo.back.generic.type					= MTYPE_BITMAP;
ADDRGP4 cdkeyMenuInfo+996
CNSTI4 6
ASGNI4
line 234
;234:	cdkeyMenuInfo.back.generic.name					= ART_BACK0;
ADDRGP4 cdkeyMenuInfo+996+4
ADDRGP4 $199
ASGNP4
line 235
;235:	cdkeyMenuInfo.back.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cdkeyMenuInfo+996+44
CNSTU4 260
ASGNU4
line 236
;236:	cdkeyMenuInfo.back.generic.id					= ID_BACK;
ADDRGP4 cdkeyMenuInfo+996+8
CNSTI4 12
ASGNI4
line 237
;237:	cdkeyMenuInfo.back.generic.callback				= UI_CDKeyMenu_Event;
ADDRGP4 cdkeyMenuInfo+996+48
ADDRGP4 UI_CDKeyMenu_Event
ASGNP4
line 238
;238:	cdkeyMenuInfo.back.generic.x					= 0;
ADDRGP4 cdkeyMenuInfo+996+12
CNSTI4 0
ASGNI4
line 239
;239:	cdkeyMenuInfo.back.generic.y					= 480-64;
ADDRGP4 cdkeyMenuInfo+996+16
CNSTI4 416
ASGNI4
line 240
;240:	cdkeyMenuInfo.back.width						= 128;
ADDRGP4 cdkeyMenuInfo+996+76
CNSTI4 128
ASGNI4
line 241
;241:	cdkeyMenuInfo.back.height						= 64;
ADDRGP4 cdkeyMenuInfo+996+80
CNSTI4 64
ASGNI4
line 242
;242:	cdkeyMenuInfo.back.focuspic						= ART_BACK1;
ADDRGP4 cdkeyMenuInfo+996+60
ADDRGP4 $216
ASGNP4
line 244
;243:
;244:	Menu_AddItem( &cdkeyMenuInfo.menu, &cdkeyMenuInfo.banner );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 cdkeyMenuInfo+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 245
;245:	Menu_AddItem( &cdkeyMenuInfo.menu, &cdkeyMenuInfo.frame );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 cdkeyMenuInfo+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 246
;246:	Menu_AddItem( &cdkeyMenuInfo.menu, &cdkeyMenuInfo.cdkey );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 cdkeyMenuInfo+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 247
;247:	Menu_AddItem( &cdkeyMenuInfo.menu, &cdkeyMenuInfo.accept );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 cdkeyMenuInfo+908
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 248
;248:	if( uis.menusp ) {
ADDRGP4 uis+16
INDIRI4
CNSTI4 0
EQI4 $221
line 249
;249:		Menu_AddItem( &cdkeyMenuInfo.menu, &cdkeyMenuInfo.back );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 cdkeyMenuInfo+996
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 250
;250:	}
LABELV $221
line 252
;251:
;252:	trap_GetCDKey( cdkeyMenuInfo.cdkey.field.buffer, cdkeyMenuInfo.cdkey.field.maxchars + 1 );
ADDRGP4 cdkeyMenuInfo+576+60+12
ARGP4
ADDRGP4 cdkeyMenuInfo+576+60+268
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 trap_GetCDKey
CALLV
pop
line 253
;253:	if( trap_VerifyCDKey( cdkeyMenuInfo.cdkey.field.buffer, NULL ) == qfalse ) {
ADDRGP4 cdkeyMenuInfo+576+60+12
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
ADDRGP4 trap_VerifyCDKey
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $231
line 254
;254:		cdkeyMenuInfo.cdkey.field.buffer[0] = 0;
ADDRGP4 cdkeyMenuInfo+576+60+12
CNSTI1 0
ASGNI1
line 255
;255:	}
LABELV $231
line 256
;256:}
LABELV $126
endproc UI_CDKeyMenu_Init 4 12
export UI_CDKeyMenu_Cache
proc UI_CDKeyMenu_Cache 0 4
line 264
;257:
;258:
;259:/*
;260:=================
;261:UI_CDKeyMenu_Cache
;262:=================
;263:*/
;264:void UI_CDKeyMenu_Cache( void ) {
line 265
;265:	trap_R_RegisterShaderNoMip( ART_ACCEPT0 );
ADDRGP4 $178
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 266
;266:	trap_R_RegisterShaderNoMip( ART_ACCEPT1 );
ADDRGP4 $195
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 267
;267:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $199
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 268
;268:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $216
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 269
;269:	trap_R_RegisterShaderNoMip( ART_FRAME );
ADDRGP4 $146
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 270
;270:}
LABELV $239
endproc UI_CDKeyMenu_Cache 0 4
export UI_CDKeyMenu
proc UI_CDKeyMenu 0 4
line 278
;271:
;272:
;273:/*
;274:===============
;275:UI_CDKeyMenu
;276:===============
;277:*/
;278:void UI_CDKeyMenu( void ) {
line 279
;279:	UI_CDKeyMenu_Init();
ADDRGP4 UI_CDKeyMenu_Init
CALLV
pop
line 280
;280:	UI_PushMenu( &cdkeyMenuInfo.menu );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 281
;281:}
LABELV $240
endproc UI_CDKeyMenu 0 4
export UI_CDKeyMenu_f
proc UI_CDKeyMenu_f 0 0
line 289
;282:
;283:
;284:/*
;285:===============
;286:UI_CDKeyMenu_f
;287:===============
;288:*/
;289:void UI_CDKeyMenu_f( void ) {
line 290
;290:	UI_CDKeyMenu();
ADDRGP4 UI_CDKeyMenu
CALLV
pop
line 291
;291:}
LABELV $241
endproc UI_CDKeyMenu_f 0 0
bss
align 4
LABELV cdkeyMenuInfo
skip 1084
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
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
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
LABELV $216
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $199
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $195
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $178
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $160
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $146
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 117
byte 1 116
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $138
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 0
align 1
LABELV $128
byte 1 49
byte 1 0
align 1
LABELV $127
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $125
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $124
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 114
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 44
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 0
align 1
LABELV $121
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 0

# OpenArenaBB
OpenArena for BB 10

How ?

-Entrypoint is in Sys.

-Build everythings in momentics IDE

-Everythings but q3_ui, ui, game, & cgame build them with the qvm tools (lcc compiler). Then put them in the pk3 files (replace files in vm folder).

-Pk3 files can be found on the official open arena website (0.8.8 version) (I've made no change to the artwork itself)

-Replace YOURMASTERSERVER with a valid domaine with a dpmaster instance runing.

-Define symbols : STANDALONE USE_OPENAL USE_VOIP VCMODS_NOSDL

-Migth be easier to compile the game in library (static) than to compile directly all the sources in one executable. (Ie : build everything as sys library & then link)

All this stuff is under the terms of GPL. Game engine : Ioquake project (based on quake 3). Game artwork : Open Arena. This game is also based SDL12, TouchControlOverlay & speex libraries.

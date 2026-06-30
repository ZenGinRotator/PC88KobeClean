-- Single Disk --
55_Alpha (demo) [FD]
55_Alpha (Square)
55_Alpha [extras]
55_Alpha [FD] -> Alpha.d88
55_Alpha [FD] [Set 1] -> Alpha [Set 1].d88
55_Alpha [FD] [Set 2] -> Alpha [Set 2].d88

-- Multi Disk --
535_Gaiflame [FD]
  |_ ....(Disk A).d88
  |_ ....(Disk B).d88
  |_ ..(Disk B) [Alt 1].d88
  |_ ..(Disk B) [Alt 2].d88
  |_ ..(Disk B) [Alt 3].d88

535_Gaiflame [FD] [Set 1]
  |_ Gaiflame [Set 1] (Disk A).d88
  |_ Gaiflame [Set 1] (Disk B).d88

535_Gaiflame [FD] [Set 2]
  |_
	
55_Alpha (demo) [FD]
55_Alpha (Square)
55_Alpha [extras]
55_Alpha [FD]
55_Alpha [FD] [Set 1]
55_Alpha [FD] [Set 2]
another rom directoryhas [b] in its title, contains .d88 file labled with [bad sectors].d88
(Disk A) [Alt n] disk might be a substittute for (Disk A) -- see 535_Gaiflame



root (has the script)
|_ CONTENTS (each sub-directory lists information as directories - no files -- need CONTENTS.BAT)
  |_ DEMOS (titles of rom directories containing the word "(demo)"-- need DEMOS.BAT)
  |_ ALTS (titles of rom directories that contain an "alts" sub-directory directory -- need ALTS.BAT)
  |_ SETS (has rom_dir with Set X directory [rom have might > 1 Sets -- need SETS.BAT)
  |_ EXTRAS (has rom_dirs with 'extras' directory -- need EXTRAS.BAT)
  |_ EXTENSIONS (has rom_dirs containing the following file types):
    |_ PDFS
    |_ JPGS
    |_ PNGS
    |_ GIFS
    |_ D88
    |_ T88
    |_ WAV
    |_ ....
  |_ CATEGORIES (has rom_dirs within dirs for (demo), [Alt n], [Set n])




535_Gaiflame [FD]
  |_ ....(Disk A).d88
  |_ ....(Disk B).d88
  |_ ..(Disk B) [Alt 1].d88
  |_ ..(Disk B) [Alt 2].d88
  |_ ..(Disk B) [Alt 3].d88

535_Gaiflame [FD] [Set 1]
  |_ Gaiflame [Set 1] (Disk A).d88
  |_ Gaiflame [Set 1] (Disk B).d88

535_Gaiflame [FD] [Set 2]
  |_
	

another rom directoryhas [b] in its title, contains .d88 file labled with [bad sectors].d88
(Disk A) [Alt n] disk might be a substittute for (Disk A) -- see 535_Gaiflame


55_Alpha (demo) [FD]
55_Alpha (Square)
55_Alpha [extras]
55_Alpha [FD]
55_Alpha [FD] [Set 1]
55_Alpha [FD] [Set 2]

1847_XZR (Exile) [extras]
1847_XZR (Exile) [FD]
1847_XZR (Exile) II (demo) [FD] [b] * (parsing for first () pair, but need second () pair)
1847_XZR (Exile) II [extras]
1847_XZR (Exile) II [FD]


(desired categ_types: all found parsing using function that uses can switch between () & []

--cats--			-- var names --		-- type --
				* cd=avoid curr directory
[CD], 				cd_ 			game
[CT], 				ct_			game
[CT cmt], 			ct_cmt			game
[CT t88], 			ct_t88			game

** needs own boxart
*** 335, 1703, 1786, 1872 have demo and a set1 demo, 1871 has demo, set 1 demo and set 2 demo
(demo), 			dmo 			demo

** needs own boxart
(demo version) [FD], 		dmo_vrsn			demo

(Easy hack) [FD], 		ez_hack			game
(English CP-M version) [FD], 	eng_cpm_vrsn 			game	
[extras], 			extrs			img, txt, pdf
[FD], 				fd			game
[FD] [Set n], 
(hack) [FD], 			hack 			game
(invincibility hack) [FD], 	inv_hak			game
(Kai hack) [FD], 		kai_hak			game
(mkll) "LL" [FD], 		mk2l			game	
(mkll) "LL" [FD] [Set n], 
(Music Box) [FD], 		musc_box			audio
(Music Box) [FD] [Set n], 				
(music disk) [FD], 		musc_dsk			audio
(Music Gallery) [FD], 		musc_gal			audio
(music mode) [FD], 		musc_mod			audio

** needs own boxart
(sample game) [FD], 		sampl_gm			demo

** needs own boxart
(sample version) [FD], 		sampl_vrsn			demo
(SR) [FD], 			sr			game
(SR) [FD] [Set n],
(SR) [extras]
(SR) [FD] [Set n] [b],  parse 1st word <()/[]>, then parse 2nd word <[]>, then parse 3rd word <[]>

root (has the script)
|_ REPO_CONTENTS (only has directories - no files -- need CONTENTS.BAT)
  |_ DISK_CATEGORIES (has directories for each disk type, annotated with (type), [type], etc.)
		     (for a given rom, there might be more than one iteration of that type)
		     (example: rom1 [FD], rom1 [FD] [Set 1])

    |_ [FD] (need if not exist, make)
      |_ num_rom1 [FD] (if not exist, make)
      |_ num_rom1 [FD] [Set1] (if not exist, make)
    |_(demo)
      |_ rom1 (demo)
      |_ rom1 (another demo) 
			
			
    |_ DEMOS (titles of rom directories containing the word "(demo)"-- need DEMOS.BAT)
    |_ ALTS (titles of rom directories that contain an "alts" sub-directory directory -- need ALTS.BAT)
    |_ SETS (has rom_dir with Set X directory [rom have might > 1 Sets -- need SETS.BAT)
    |_ EXTRAS (has rom_dirs with 'extras' directory -- need EXTRAS.BAT)
    |_ .... any other category
  |_ FILE_EXTENSIONS (has rom_dirs containing the following file types):
    |_ PDFS
    |_ JPGS
    |_ PNGS
    |_ GIFS
    |_ D88
    |_ T88
    |_ WAV
    |_ .... any other extension

----- BEFORE IMPLEMENTING COLLECTED, TEST SETS & ALTS IN PS CLASSIC ------
	
	@ REM What about alts? sets?
|_ COLLECTED (each sub-root contains rom_dir and files related to rom_dir)
|_ Pointers (each subroot contains the rom_dir and file_dir, for files originally located in rom_dir
  |_ROMS
    |_ MULTI_DISK (rom_dir needs m3u file) *can have set1, set2
      |_ N_Rom1 dir - general (dir-artify in es)
      |_ N_Rom1 (dir-artify, with m3u-artify in es)
      |_ N_Rom1 [Set 1] dir artify (with m3u-artify in es)
      |_ N_Rom1 [Set 2] dir artify (with m3u-artify in es)

    |_ SINGLE_DISK  *can have set1, set2
      |_ N_Rom1 dir - general (artify)
      |_ N_Rom1 dir - disc (artify)
      |_ N_Rom1 dir - disc [Set 1] (artify)
      |_ N_Rom1 dir - disc[Set 2] (artify)
  |_ IMAGES
    |_ ALL
      |_Rom
         |_ N_Rom dir
	   |_ x.pdf, x.jpg, x.gif, x.png
	 |_EXTENSIONS -- don't know if needed -- already in content/extensions
           |_ .PDFS
	     |_ N_Rom dir
	       |_ x.pdf
           |_ PNGS
	     |_ N_Rom dir
	       |_ x.png
           |_ JPGS
	     |_ N_Rom dir
	       |_ x.jpg
           |_ GIFS
	     |_ N_Rom dir
	       |_ x.gif

    |_ SELECTED (has all images, but after manual deletion, keep wanted image for gamelist.txt)
      |_ N_Rom1 dir
        |_ single image file.pdf/jpg/etc
  |_ AUDIO
  |_ DEMOS (demo-containing directory with its demo file, some roms have 2 demo files)
  |_ TXT


"Pick m3u to load all disks"
"Start all disks with m3u" title in rom_dir for multi-disk games
pc88
  |_ <Multi Disc> Rom1
    |_ Rom1 Disk A.d88
    |_ Rom1 Disk B.d88
    |_ Rom1 (Load All Disks).m3u

	@ REM What about alts? sets?
|_ PROJECT_ERIS
  |_ ROMS
    |_ pc88 (has individiual disk files for 1-disk roms (.d88, .t88, .cmt)
      |_ MULTI_DISK (rom_dir needs m3u file)
	|_ Rom1 Dir (art)
	  |_ Rom1 Disc A
	  |_ Rom1 Disc B
	  |_ Rom1 (Load All Disks).m3u (art)
      |_ <single disc> Rom2.d88 (art)
      |_ <single disc> Rom2 [Set 1].d88 (art)
      |_ <single disc> Rom3.d88 (art)
      |_ DEMOS ("(demo)" file only)
	|_ Rom1.d88 (art)
	|_ Rom2.d88 (art)
	|_ Rom2 [Set 1].d88 (art)
	|_ Rom3.d88 (art)
  |_ LOCAL_IMAGES (contains images for roms)
    |_ ROM 1.JPG
    |_ ROM 2.GIF

|_ gamelists.txt

What about sets and alts? need to create
CONTENTS & NPE directories first and test sets & alts with pe to see their purpose


sort by parentheseis first, then brackets

Brackets - d88/t88
Alt 01
Alt X
b
bad sectors
read-only
self-destructs
Set 1
Set 01
tape conversion


Parentheses - d88 - separate from traditional files
cheat disk
cheats
demo
Demo disk
demo version
hack
Music Box
musick disk
Music Gallery
music mode
sample game (is a multi disk game)
sample version

*sort by parentheses (<demo>,<music>, <set x>, <set y>,....


cannot sort by set <number>, best to use m3u for all sets in rom directory
nonset (primary
set1
set
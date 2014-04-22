local MusicMgr = {}
MusicMgr.__index = MusicMgr
MusicMgr.STATE_NONE     = 0
MusicMgr.STATE_MENU     = 1
MusicMgr.STATE_INGAME   = 2
MusicMgr.STATE_MINIGAME = 3
MusicMgr.STATE_GAMEOVER = 4

local musicState = MusicMgr.STATE_NONE
local menuSong = "groovecallus"
local minigameSong = "radiationwoman"
local gameOverSong = "interlude"
local ingameSongs = {}

function MusicMgr.loadSongs()
	for i, song in ipairs(love.filesystem.getDirectoryItems("res/music/")) do
		if string.sub(song, -4, -1) == ".ogg" then
			song = string.sub(song, 1, -5)
			if song ~= menuSong and song ~= minigameSong and song ~= gameOverSong then
				table.insert(ingameSongs, song)
			end
		end
	end
end

function MusicMgr.playMenu()
	if musicState == MusicMgr.STATE_MENU then return end
	playMusic(menuSong)
	musicState = MusicMgr.STATE_MENU
end

function MusicMgr.playIngame()
	if musicState == MusicMgr.STATE_INGAME then return end
	playMusic(table.random(ingameSongs))
	musicState = MusicMgr.STATE_INGAME
end

function MusicMgr.playMinigame()
	if musicState == MusicMgr.STATE_MINIGAME then return end
	playMusic(minigameSong)
	musicState = MusicMgr.STATE_MINIGAME
end

function MusicMgr.playGameOver()
	if musicState == MusicMgr.STATE_GAMEOVER then return end
	playMusic(gameOverSong)
	musicState = MusicMgr.STATE_GAMEOVER
end

return MusicMgr

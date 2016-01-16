Config {
	  font = "xft:Ubuntu Mono:pixelsize=11:antialias=true"
	, bgColor = "#000000"
	, fgColor = "grey"
	, iconOffset = 6
	, position = Bottom { height = 11 }
	, commands = [
		  Run MultiCpu [
			  "-t", "[<icon=/home/newbrict/.xmobar/stlarch_icons/cpu13.xbm/><total0>] [<icon=/home/newbrict/.xmobar/stlarch_icons/cpu13.xbm/><total1>] [<icon=/home/newbrict/.xmobar/stlarch_icons/cpu13.xbm/><total2>] [<icon=/home/newbrict/.xmobar/stlarch_icons/cpu13.xbm/><total3>]"
			, "-L", "15"
			, "-H", "45"
			, "-w", "3"
			, "-l", "cyan"
			, "-n", "green"
			, "-h", "red"
		] 10
		, Run Memory [
			  "-t", "[<icon=/home/newbrict/.xmobar/stlarch_icons/mem1.xbm/><usedratio>]"
			, "-w", "3"
		] 10
		, Run Uptime [
			"-t", "[<days>d <hours>h <minutes>m]"
		] 10
		, Run Network "wlp3s0" [
			  "-t", "[<icon=/home/newbrict/.xmobar/stlarch_icons/downarrow1.xbm/><rx> | <icon=/home/newbrict/.xmobar/stlarch_icons/uparrow1.xbm/><tx>]"
			, "-L", "500000"
			, "-S", "True"
			, "-H", "5000000"
			, "-l", "white"
			, "-w", "3"
			, "-n", "cyan"
			, "-h", "red"
		] 10
		--, Run Com "/home/newbrict/Documents/git/bitcoin-prices/btcp_xmobar.sh" [""] "btc" 10
		--, Run Com "/home/newbrict/Documents/random/rpiclassgrab/xmobar.sh" [""] "seats" 10
	]
	, sepChar = "%"
	, alignSep = "}{"
	, template = "<fc=grey> %multicpu% - %memory% - %wlp3s0% - %uptime% </fc>}{"
}

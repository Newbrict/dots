Config {
	  font = "xft:Ubuntu Mono:pixelsize=14:antialias=true"
	, bgColor = "#000000"
	, fgColor = "grey"
	, position = Top { height = 14 }
	, commands = [
		  Run Date "%H:%M:%S | %Y-%m-%d" "date" 10
		, Run BatteryP ["BAT0"] [
	 		  "-t", "<acstatus><left>%"
			, "-L", "15"
			, "-H", "60"
			, "-p", "3"
			, "-l", "red"
			, "-n", "green"
			, "-h", "white"
			, "--"
			, "-i", "<fc=yellow><icon=/home/plant/.xmobar/stlarch_icons/ac15.xbm/></fc>"
			, "-O", "<fc=yellow><icon=/home/plant/.xmobar/stlarch_icons/ac15.xbm/></fc>"
			, "-o", "<fc=#EEEEEE><icon=/home/plant/.xmobar/stlarch_icons/batt5full.xbm/></fc>"
		] 50
		, Run StdinReader
	]
	, sepChar = "%"
	, alignSep = "}{"
	, template = " %StdinReader%}%battery%{<fc=#FFFFFF>%date%</fc>"
}

:: Programmed by hXR16F
:: hXR16F.ar@gmail.com

@echo off
if defined __ goto :main
set __=.
darkbox -im | %0 %* | darkbox
set __=
pause >nul
goto :eof

:main
	color 07
	echo -rs
	set debug=1
	
	setlocal EnableDelayedExpansion
	reg add "HKCU\Console" /V "ForceV2" /T "REG_DWORD" /D "0x00000000" /F >nul
	title Tic Tac Toe
	color 07
	mode 41,40
	call bg.exe font 2
	echo -sh 0
	
	for /l %%i in (1,1,9) do set player[%%i]=0
	for /l %%i in (1,1,9) do set ai[%%i]=0
	
	
	if %debug% equ 1 (
		echo -gcdgcd 1 1 0xf0 "                                       " 2 1 0x0f " X:0, Y:0 "
	) else (
		echo -gcd 1 1 0x0f " "
	)
	call :display
	
	call :rand 1 4
	if %RAND_NUM% equ 1 (
		set player_turn=0&set ai_turn=1
		goto :loop
	) else (
		if %RAND_NUM% equ 2 (
			goto :ai_turn
		) else (
			if %RAND_NUM% equ 3 (
				set player_turn=0&set ai_turn=1
				goto :loop
			) else (
				if %RAND_NUM% equ 4 (
					goto :ai_turn
				)
			)
		)
	)
	
	goto :loop
	
	:display
		echo -10n
		echo -5cdcdcdcdcdn 0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo -cdcdn 0x0f "            " 0xf0 "                 "
		echo -5cdcdcdcdcdn 0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo -cdcdn 0x0f "            " 0xf0 "                 "
		echo -5cdcdcdcdcdn 0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		echo               0x0f "                 " 0xf0 " " 0x0f "     " 0xf0 " " 0x0f "     "
		exit /b
		
	:ai_turn
		set player_turn=0&set ai_turn=1
		call :rand 1 9
		if %RAND_NUM% equ 7 (
			if %player[7]% equ 0 (
				if %ai[7]% equ 0 (
					echo -gcd 14 12 0xc0 " "&echo -gcd 13 13 0xc0 " "&echo -gcd 15 13 0xc0 " "&echo -gcd 14 14 0xc0 " "
					set ai[7]=1
				) else (
					goto :ai_turn
				)
			) else (
				goto :ai_turn
			)
		)
		if %RAND_NUM% equ 8 (
			if %player[8]% equ 0 (
				if %ai[8]% equ 0 (
					echo -gcd 20 12 0xc0 " "&echo -gcd 19 13 0xc0 " "&echo -gcd 21 13 0xc0 " "&echo -gcd 20 14 0xc0 " "
					set ai[8]=1
				) else (
					goto :ai_turn
				)
			) else (
				goto :ai_turn
			)
		)
		if %RAND_NUM% equ 9 (
			if %player[9]% equ 0 (
				if %ai[9]% equ 0 (
					echo -gcd 26 12 0xc0 " "&echo -gcd 25 13 0xc0 " "&echo -gcd 27 13 0xc0 " "&echo -gcd 26 14 0xc0 " "
					set ai[9]=1
				) else (
					goto :ai_turn
				)
			) else (
				goto :ai_turn
			)
		)
		if %RAND_NUM% equ 4 (
			if %player[4]% equ 0 (
				if %ai[4]% equ 0 (
					echo -gcd 14 18 0xc0 " "&echo -gcd 13 19 0xc0 " "&echo -gcd 15 19 0xc0 " "&echo -gcd 14 20 0xc0 " "
					set ai[4]=1
				) else (
					goto :ai_turn
				)
			) else (
				goto :ai_turn
			)
		)
		if %RAND_NUM% equ 5 (
			if %player[5]% equ 0 (
				if %ai[5]% equ 0 (
					echo -gcd 20 18 0xc0 " "&echo -gcd 19 19 0xc0 " "&echo -gcd 21 19 0xc0 " "&echo -gcd 20 20 0xc0 " "
					set ai[5]=1
				) else (
					goto :ai_turn
				)
			) else (
				goto :ai_turn
			)
		)
		if %RAND_NUM% equ 6 (
			if %player[6]% equ 0 (
				if %ai[6]% equ 0 (
					echo -gcd 26 18 0xc0 " "&echo -gcd 25 19 0xc0 " "&echo -gcd 27 19 0xc0 " "&echo -gcd 26 20 0xc0 " "
					set ai[6]=1
				) else (
					goto :ai_turn
				)
			) else (
				goto :ai_turn
			)
		)
		if %RAND_NUM% equ 1 (
			if %player[1]% equ 0 (
				if %ai[1]% equ 0 (
					echo -gcd 14 24 0xc0 " "&echo -gcd 13 25 0xc0 " "&echo -gcd 15 25 0xc0 " "&echo -gcd 14 26 0xc0 " "
					set ai[1]=1
				) else (
					goto :ai_turn
				)
			) else (
				goto :ai_turn
			)
		)
		if %RAND_NUM% equ 2 (
			if %player[2]% equ 0 (
				if %ai[2]% equ 0 (
					echo -gcd 20 24 0xc0 " "&echo -gcd 19 25 0xc0 " "&echo -gcd 21 25 0xc0 " "&echo -gcd 20 26 0xc0 " "
					set ai[2]=1
				) else (
					goto :ai_turn
				)
			) else (
				goto :ai_turn
			)
		)
		if %RAND_NUM% equ 3 (
			if %player[3]% equ 0 (
				if %ai[3]% equ 0 (
					echo -gcd 26 24 0xc0 " "&echo -gcd 25 25 0xc0 " "&echo -gcd 27 25 0xc0 " "&echo -gcd 26 26 0xc0 " "
					set ai[3]=1
				) else (
					goto :ai_turn
				)
			) else (
				goto :ai_turn
			)
		)
		
		goto :next_turn
	
	:click_calculate %1
		if %1 equ 7 (
			if %player[7]% equ 0 (
				if %ai[7]% equ 0 (
					echo -gcd 13 12 0xa0 " "&echo -gcd 15 12 0xa0 " "&echo -gcd 14 13 0xa0 " "&echo -gcd 13 14 0xa0 " "&echo -gcd 15 14 0xa0 " "
					set player[7]=1
					set player_turn=1&set ai_turn=0
				)
			)
		)
		if %1 equ 8 (
			if %player[8]% equ 0 (
				if %ai[8]% equ 0 (
					echo -gcd 19 12 0xa0 " "&echo -gcd 21 12 0xa0 " "&echo -gcd 20 13 0xa0 " "&echo -gcd 19 14 0xa0 " "&echo -gcd 21 14 0xa0 " "
					set player[8]=1
					set player_turn=1&set ai_turn=0
				)
			)
		)
		if %1 equ 9 (
			if %player[9]% equ 0 (
				if %ai[9]% equ 0 (
					echo -gcd 25 12 0xa0 " "&echo -gcd 27 12 0xa0 " "&echo -gcd 26 13 0xa0 " "&echo -gcd 25 14 0xa0 " "&echo -gcd 27 14 0xa0 " "
					set player[9]=1
					set player_turn=1&set ai_turn=0
				)
			)
		)
		if %1 equ 4 (
			if %player[4]% equ 0 (
				if %ai[4]% equ 0 (
					echo -gcd 13 18 0xa0 " "&echo -gcd 15 18 0xa0 " "&echo -gcd 14 19 0xa0 " "&echo -gcd 13 20 0xa0 " "&echo -gcd 15 20 0xa0 " "
					set player[4]=1
					set player_turn=1&set ai_turn=0
				)
			)
		)
		if %1 equ 5 (
			if %player[5]% equ 0 (
				if %ai[5]% equ 0 (
					echo -gcd 19 18 0xa0 " "&echo -gcd 21 18 0xa0 " "&echo -gcd 20 19 0xa0 " "&echo -gcd 19 20 0xa0 " "&echo -gcd 21 20 0xa0 " "
					set player[5]=1
					set player_turn=1&set ai_turn=0
				)
			)
		)
		if %1 equ 6 (
			if %player[6]% equ 0 (
				if %ai[6]% equ 0 (
					echo -gcd 25 18 0xa0 " "&echo -gcd 27 18 0xa0 " "&echo -gcd 26 19 0xa0 " "&echo -gcd 25 20 0xa0 " "&echo -gcd 27 20 0xa0 " "
					set player[6]=1
					set player_turn=1&set ai_turn=0
				)
			)
		)
		if %1 equ 1 (
			if %player[1]% equ 0 (
				if %ai[1]% equ 0 (
					echo -gcd 13 24 0xa0 " "&echo -gcd 15 24 0xa0 " "&echo -gcd 14 25 0xa0 " "&echo -gcd 13 26 0xa0 " "&echo -gcd 15 26 0xa0 " "
					set player[1]=1
					set player_turn=1&set ai_turn=0
				)
			)
		)
		if %1 equ 2 (
			if %player[2]% equ 0 (
				if %ai[2]% equ 0 (
					echo -gcd 19 24 0xa0 " "&echo -gcd 21 24 0xa0 " "&echo -gcd 20 25 0xa0 " "&echo -gcd 19 26 0xa0 " "&echo -gcd 21 26 0xa0 " "
					set player[2]=1
					set player_turn=1&set ai_turn=0
				)
			)
		)
		if %1 equ 3 (
			if %player[3]% equ 0 (
				if %ai[3]% equ 0 (
					echo -gcd 25 24 0xa0 " "&echo -gcd 27 24 0xa0 " "&echo -gcd 26 25 0xa0 " "&echo -gcd 25 26 0xa0 " "&echo -gcd 27 26 0xa0 " "
					set player[3]=1
					set player_turn=1&set ai_turn=0
				)
			)
		)
		
		exit /b
	
	:next_turn
		call :ifwin
		call :iffull
		if %player_turn% equ 1 (
			set player_turn=0&set ai_turn=0
			goto :ai_turn
		) else (
			if %ai_turn% equ 1 (
				set player_turn=0&set ai_turn=0
				goto :loop
			)
		)
	
	:loop
		set /p i=
		for /f "tokens=2,3,4" %%a in ("%i%") do (
			set x=%%a
			set y=%%b
			set c=%%c
			goto :clicked
		)
		goto :loop
		
	:clicked
		if %c% equ 1 (
			if %debug% equ 1 (
				echo -gcdgcd 1 1 0xf0 "                                       " 2 1 0x0f " X:%x%, Y:%y% "
			) else (
				echo -gcd 1 1 0x0f " "
			)
			if %x% geq 12 if %x% leq 16 if %y% geq 11 if %y% leq 15 call :click_calculate 7
			if %x% geq 18 if %x% leq 22 if %y% geq 11 if %y% leq 15 call :click_calculate 8
			if %x% geq 24 if %x% leq 28 if %y% geq 11 if %y% leq 15 call :click_calculate 9
			if %x% geq 12 if %x% leq 16 if %y% geq 17 if %y% leq 21 call :click_calculate 4
			if %x% geq 18 if %x% leq 22 if %y% geq 17 if %y% leq 21 call :click_calculate 5
			if %x% geq 24 if %x% leq 28 if %y% geq 17 if %y% leq 21 call :click_calculate 6
			if %x% geq 12 if %x% leq 16 if %y% geq 23 if %y% leq 27 call :click_calculate 1
			if %x% geq 18 if %x% leq 22 if %y% geq 23 if %y% leq 27 call :click_calculate 2
			if %x% geq 24 if %x% leq 28 if %y% geq 23 if %y% leq 27 call :click_calculate 3
		)
		
		goto :next_turn
		
	:iffull
		set full=1
		for /l %%i in (1,1,9) do (
			if "!player[%%i]!" equ "1" set /a full+=1
			if "!ai[%%i]!" equ "1" set /a full+=1
		)
		if %full% equ 10 (
			goto :draw
		)
		exit /b
		
	:ifwin
		if "%player[7]%" equ "1" if "%player[8]%" equ "1" if "%player[9]%" equ "1" goto :win
		if "%player[4]%" equ "1" if "%player[5]%" equ "1" if "%player[6]%" equ "1" goto :win
		if "%player[1]%" equ "1" if "%player[2]%" equ "1" if "%player[3]%" equ "1" goto :win
		if "%player[7]%" equ "1" if "%player[4]%" equ "1" if "%player[1]%" equ "1" goto :win
		if "%player[8]%" equ "1" if "%player[5]%" equ "1" if "%player[2]%" equ "1" goto :win
		if "%player[9]%" equ "1" if "%player[6]%" equ "1" if "%player[3]%" equ "1" goto :win
		if "%player[7]%" equ "1" if "%player[5]%" equ "1" if "%player[3]%" equ "1" goto :win
		if "%player[9]%" equ "1" if "%player[5]%" equ "1" if "%player[1]%" equ "1" goto :win
		
		if "%ai[7]%" equ "1" if "%ai[8]%" equ "1" if "%ai[9]%" equ "1" goto :lose
		if "%ai[4]%" equ "1" if "%ai[5]%" equ "1" if "%ai[6]%" equ "1" goto :lose
		if "%ai[1]%" equ "1" if "%ai[2]%" equ "1" if "%ai[3]%" equ "1" goto :lose
		if "%ai[7]%" equ "1" if "%ai[4]%" equ "1" if "%ai[1]%" equ "1" goto :lose
		if "%ai[8]%" equ "1" if "%ai[5]%" equ "1" if "%ai[2]%" equ "1" goto :lose
		if "%ai[9]%" equ "1" if "%ai[6]%" equ "1" if "%ai[3]%" equ "1" goto :lose
		if "%ai[7]%" equ "1" if "%ai[5]%" equ "1" if "%ai[3]%" equ "1" goto :lose
		if "%ai[9]%" equ "1" if "%ai[5]%" equ "1" if "%ai[1]%" equ "1" goto :lose
		
		exit /b
		
	:win
		echo -gcaaaaaaaaaaaaaaaaaaaaaaa 9 17 0x09 220 220 220 220 220 220 220 220 220 220 220 220 220 220 220 220 220 220 220 220 220 220 220
		echo -gcd 9 18 0xf0 "                       "
		echo -gcd 9 19 0xf0 "  You are the winner^!  "
		echo -gcd 9 20 0xf0 "                       "
		echo -gcaaaaaaaaaaaaaaaaaaaaa 10 21 0x07 223 223 223 223 223 223 223 223 223 223 223 223 223 223 223 223 223 223 223 223 223
		@ping localhost -n 3 >nul
		goto :main
		
	:lose
		echo -gcaaaaaaaaaaaaa 14 17 0x0c 220 220 220 220 220 220 220 220 220 220 220 220 220
		echo -gcd 14 18 0xf0 "             "
		echo -gcd 14 19 0xf0 "  You lose^!  "
		echo -gcd 14 20 0xf0 "             "
		echo -gcaaaaaaaaaaa 15 21 0x07 223 223 223 223 223 223 223 223 223 223 223
		@ping localhost -n 3 >nul
		goto :main
		
	:draw
		echo -gcaaaaaaaaa 16 17 0x08 220 220 220 220 220 220 220 220 220
		echo -gcd 16 18 0xf0 "         "
		echo -gcd 16 19 0xf0 "  Draw^!  "
		echo -gcd 16 20 0xf0 "         "
		echo -gcaaaaaaa 17 21 0x07 223 223 223 223 223 223 223
		@ping localhost -n 3 >nul
		goto :main
		
	:rand
		set /a RAND_NUM=%RANDOM% * (%2 - %1 + 1) / 32768 + %1
		exit /b
		
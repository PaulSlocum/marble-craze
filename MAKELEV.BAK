#include<fstream.h>
#include<conio.h>
#include<math.h>
#include<string.h>

char convBinary( char inChar )
{
	if( inChar == 'X' )
		return('1');
	return('0');
}

void removeX( char* inString, char screen )
{
	if( inString[0] == 'X' )
	{
		inString[0] = 'F';
//		inString[0] = screen;
//		inString[1] = 'F';
		inString[1] = 0;
	}
}

int main( int argc, char *argv[] )
{
	char buffer[100];
	char level[5];
	char pfColor[5];

	char playField[22][22];

	char defaultColors[50];

	char keyMask[50];
	char powerUpType[50];

	int running;
	int screen;

	char inFileName[20];
	char scrFileName[20];
	char contFileName[20];
	char ptrFileName[20];

	int i, j;

	const char screenChars[] = "0123456789ABCDEFGHIJKLMNOP";


	strcpy( inFileName, "level" );
	strcpy( scrFileName, "l" );
	strcpy( contFileName, "l" );
	strcpy( ptrFileName, "l" );

	// handle command line stuff
	if( argc == 2 )
	{
		strcat( inFileName, argv[1] );
		strcat( scrFileName, argv[1] );
		strcat( contFileName, argv[1] );
		strcat( ptrFileName, argv[1] );
	}
	else
	{
		strcpy( level, "" );
	}

	strcat( inFileName, ".txt" );
	strcat( scrFileName, "_scr.asm" );
	strcat( contFileName, "_cont.asm" );
	strcat( ptrFileName, "_ptr.asm" );


	ifstream infile( inFileName );

	ofstream scr_file( scrFileName );
	ofstream cont_file( contFileName );
	ofstream ptr_file( ptrFileName );

	//clrscr();
	cout << "\nMarble Craze level creator\n";
	cout << "reading " << inFileName << "...\n";

	infile.getline( buffer, 50 );
	if( strcmp(buffer, "LEVEL:" ) )
	{
		cout << "expected LEVEL: " << endl;
		return( 1 );
	}

	// get level number
	infile.getline( level, 5 );
	ptr_file << "level" << level << endl;


	// get playfield color
	infile.getline( buffer, 100 ); // skip line
	infile.getline( buffer, 5 );
	ptr_file << "  byte " << buffer << "    ; background color" << endl;

	// get background color
	infile.getline( buffer, 100 ); // skip line
	infile.getline( pfColor, 5 );
	ptr_file << "  byte " << pfColor << "    ; playfield color" << endl;

	// get finish color
	infile.getline( buffer, 100 ); // skip line
	infile.getline( buffer, 5 );
	ptr_file << "  byte " << buffer << "    ; finish color" << endl;

	// get time
	infile.getline( buffer, 100 ); // skip line
	infile.getline( buffer, 5 );
	ptr_file << "  byte " << buffer << "    ; time\n\n";

	running = 1;
	screen = 0;

	while( running )
	{
		infile.getline( buffer, 100 ); // skip line

		if( !strcmp(buffer, "ENDLEVEL" ) )
		{
			running = 0;
		}
		else
		{
			if( !strcmp(buffer, "SCREEN:" ) )
			{
				// add screen to pointer file
				ptr_file << "  word lev" << level << screenChars[screen];
				ptr_file << " ,col" << level << screenChars[screen];
				ptr_file << " ,cont" << level << screenChars[screen] << endl;

				scr_file << "\n\nlev" << level << screenChars[screen] << endl;

				// Get playfield data
				for( i=0; i<12; i++ )
				{
					// get time
					infile.getline( playField[i], 100 ); // skip line
				}

				scr_file << "\n  ; PF0";

				for( i=11; i>=0; i-- )
				{
					scr_file << "\n  byte %";

					for( j=3; j>=0; j--)
					{
						scr_file << convBinary( playField[i][j] );
					}

					for( j=3; j>=0; j--)
					{
						scr_file << convBinary( playField[i][j] );
					}

				}

				scr_file << "\n\n  ; PF1";

				for( i=11; i>=0; i-- )
				{
					scr_file << "\n  byte %";

					for( j=4; j<=11; j++)
					{
						scr_file << convBinary( playField[i][j] );
					}

				}

				scr_file << "\n\n  ; PF2";

				for( i=11; i>=0; i-- )
				{
					scr_file << "\n  byte %";

					for( j=19; j>=12; j--)
					{
						scr_file << convBinary( playField[i][j] );
					}

				}


				// Control setup

				cont_file << "\ncont" << level << screenChars[screen] << endl;

				infile.getline( buffer, 100 );
				removeX( buffer, screenChars[screen] );
				cont_file << "  byte $" << buffer;

				infile.getline( buffer, 100 );
				removeX( buffer, screenChars[screen] );
				cont_file << buffer << " ; next up/down" << endl;

				infile.getline( buffer, 100 );
				removeX( buffer, screenChars[screen] );
				cont_file << "  byte $" << buffer;

				infile.getline( buffer, 100 );
				removeX( buffer, screenChars[screen] );
				cont_file << buffer << " ; next left/right" << endl;

				infile.getline( buffer, 100 );
				infile.getline( buffer, 100 );
				cont_file << "\n  byte " << buffer << " ; reset x" << endl;

				infile.getline( buffer, 100 );
				cont_file << "  byte " << buffer << " ; reset y" << endl;

				// skip line
				infile.getline( buffer, 100 );

				infile.getline( powerUpType, 100 );

				// skip line
				infile.getline( buffer, 100 );

				infile.getline( keyMask, 100 );

				if( (strcmp( powerUpType, "0" ) == 0) &&
						(strcmp( keyMask, "255" ) == 0) )
				{
					cont_file << "\n  byte SKIPBOTH  ; powerup type" << endl;
				}
				else
				{
					cont_file << "\n  byte " << powerUpType << " ; powerup type" << endl;
					cont_file << "  byte " << keyMask << " ; alt level mask" << endl;
				}

				// skip line
				infile.getline( buffer, 100 );

				if( (strcmp(keyMask, "255")) || (powerUpType[0] != '0') )
				{
					infile.getline( buffer, 100 );
					cont_file << "\n  byte " << buffer << " ; powerup x" << endl;

					infile.getline( buffer, 100 );
					cont_file << "  byte " << buffer << " ; powerup y" << endl;

					infile.getline( buffer, 100 );
					cont_file << "  byte " << buffer << " ; powerup mask" << endl;
				}
				else
				{
					infile.getline( buffer, 100 );
					infile.getline( buffer, 100 );
					infile.getline( buffer, 100 );
				}

				// skip line
				infile.getline( buffer, 100 );

				infile.getline( buffer, 100 );

				if( strcmp(keyMask, "255") )
				{
					cont_file << "\n  byte " << buffer << " ; alternate screen" << endl;
				}

				infile.getline( buffer, 100 );

				if( strcmp( buffer, "NOCOLORS" ) )
				{

					scr_file << "\n\ncol" << level << screenChars[screen] << endl;

					for( i=0; i<6; i++ )
					{
						infile.getline( buffer, 100 );
						if( buffer[0] == 'X' )
						{
							scr_file << "  byte " << pfColor << endl;
						}
						else
						{
							scr_file << "  byte " << buffer << endl;
						}
					}

					defaultColors[screen] = 0;
				}
				else
				{
					defaultColors[screen] = 1;
				}


			}
			else
			{
				running = 0;
			}

		}

		screen++;

	} // while running

	scr_file << "\n\n  ; Default colors\n";

	for( i=0; i<(screen-1); i++ )
	{
		if( defaultColors[i] )
			scr_file << "col" << level << screenChars[i] << endl;
	}

	for( i=0; i<6; i++ )
	{
		infile.getline( buffer, 100 );
		scr_file << "  byte " << pfColor << endl;
	}






	cout << "Success!\n";

	return( 0 );
}


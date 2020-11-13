#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <cstdio>
#include <cstdlib>
#include <sstream>
#include <memory>
#include <vector>
#include <cstring>
#include <iostream>

#include <unistd.h>
#include <fcntl.h>
#include <stdio.h> 

using namespace std;

void getNewFileName (char filedirname[], char *file)
{
	const char *token = strtok(file, "/");
	uint32_t i=0;

	strcpy(filedirname,"../../test_scenes/");
	while (token != NULL)
		{
			if (i == 3)
				{
					strcat(filedirname, token);
					strcat(filedirname, "/hw_byte_files/");
				}
			if (i == 4)
				{
					strcat(filedirname, token);
				}
			token = strtok(NULL, "/");
			i++;
		}
	}

// Parse .sod scene data from file and write in bytes  
int parseSceneOptionFile (char *file)
{
	ifstream ifs;
	ofstream fout;

	char filedirname[133];

	getNewFileName(filedirname, file);
	cout << filedirname << "\n";

	try
		{
			// Open the file or throw exeption
			ifs.open(file);
			if (ifs.fail()) throw;

			// Open the file for output
			fout.open(filedirname, ios::binary | ios::out);
			if (fout.fail()) throw;

			// Open stream to file
			std::stringstream ss;
			ss << ifs.rdbuf();

			// Read width 
			uint32_t width;
			ss >> width;
			// Write to file
			fout.write((char *) &width, sizeof(width));

			// Read height
			uint32_t height;
			ss >> height;
			// Write to file
			fout.write((char *) &height, sizeof(height));

			// Read FOV
			float fov;
			ss >> fov;
			// Write to file
			fout.write((char *) &fov, sizeof(fov));

			// Read background Colour
			float backgroundcolour[3];
			for (uint32_t i=0; i < 3; i++)
				{
					ss >> backgroundcolour[i];
				}
			// Write to file
			fout.write((char *) &backgroundcolour, sizeof(backgroundcolour));

			// Read camera to world
			float camera2world[16];
			for (uint32_t i=0; i < 16; i++)
				{
					ss >> camera2world[i];
				}
			// Write to file
			fout.write((char *) &camera2world, sizeof(camera2world));

			// Read bias
			float bias;
			ss >> bias;
			// Write to file
			fout.write((char *) &bias, sizeof(bias));

			// Read max depth
			uint32_t maxDepth;
			ss >> maxDepth;
			// Write to file
			fout.write((char *) &maxDepth, sizeof(maxDepth));
				
			// Read the number of lights to the world
			uint32_t temp_lights;
			ss >> temp_lights;
			// Write to file
			fout.write((char *) &temp_lights, sizeof(temp_lights));

			float light2world[16];
			uint32_t templighttype;

			for (uint32_t k = 0; k < temp_lights; k++)
				{
					// Read light type
					ss >> templighttype;
					// Write to file
					fout.write((char *) &templighttype, sizeof(templighttype));

					// Read light colour
					float lightcolour[3];
					for (uint32_t i=0; i < 3; i++)
						{
							ss >> lightcolour[i];
						}
					// Write to file
					fout.write((char *) &lightcolour, sizeof(lightcolour));

					// Read light intensity
					float colourintensity;
					ss >> colourintensity;
					// Write to file
					fout.write((char *) &colourintensity, sizeof(colourintensity));

					// Read light to world data from file
					for (uint32_t i=0; i < 16; i++)
						{
							ss >> light2world[i];
						}
					// Write to file
					fout.write((char *) &light2world, sizeof(light2world));				
				}	

		}
	catch(const std::exception& e)
		{
			std::cerr << e.what() << '\n';
			// Close the stream
			ifs.close();

			fout.close();
			return -1;
		}
	
	// Close the stream
	ifs.close();

	fout.close();

	return 0;
}

int parseGeometryFile (char *file)
{
	ifstream ifs;
	ofstream fout;
	char filedirname[133];

	getNewFileName(filedirname, file);
	cout << filedirname << "\n";
	try
		{
			// Open the file or throw exeption
			ifs.open(file);
			if (ifs.fail()) throw;

			// Open the file for output
			fout.open(filedirname, ios::binary | ios::out);
			if (fout.fail()) throw;

			// Open stream to file
			std::stringstream ss;
			ss << ifs.rdbuf();

			// Read number of faces 
			uint32_t numFaces;
			ss >> numFaces;
			// Write to file
			fout.write((char *) &numFaces, sizeof(numFaces));

			// reading face index array
			uint32_t numFacestemp;
			uint32_t vertsIndexArraySize = 0;
			for (uint32_t i = 0; i < numFaces; ++i) 
				{
					ss >> numFacestemp;
					// Write to file
					fout.write((char *) &numFacestemp, sizeof(numFacestemp));
					vertsIndexArraySize += numFacestemp;
				}

			// reading vertex index array
			uint32_t vertsArraySize = 0;
			uint32_t vertsIndexTemp;
			for (uint32_t i = 0; i < vertsIndexArraySize; ++i) 
				{
					ss >> vertsIndexTemp;
					// Write to file
					fout.write((char *) &vertsIndexTemp, sizeof(vertsIndexTemp));
					if (vertsIndexTemp > vertsArraySize) 
						{
							vertsArraySize = vertsIndexTemp;
						}
				}
			vertsArraySize += 1;

			// reading vertices
			float xTemp;
			float yTemp;
			float zTemp;
			for (uint32_t i = 0; i < vertsArraySize; ++i) 
				{
					ss >> xTemp >> yTemp >> zTemp;
					// Write to file
					fout.write((char *) &xTemp, sizeof(xTemp));	
					fout.write((char *) &yTemp, sizeof(yTemp));	
					fout.write((char *) &zTemp, sizeof(zTemp));	
				}					

			// reading normals
			for (uint32_t i = 0; i < vertsIndexArraySize; ++i) 
				{
					ss >> xTemp >> yTemp >> zTemp;
					// Write to file
					fout.write((char *) &xTemp, sizeof(xTemp));	
					fout.write((char *) &yTemp, sizeof(yTemp));	
					fout.write((char *) &zTemp, sizeof(zTemp));	
				}
			// reading st coordinates
			for (uint32_t i = 0; i < vertsIndexArraySize; ++i) 
				{
					ss >> xTemp >> yTemp;
					// Write to file
					fout.write((char *) &xTemp, sizeof(xTemp));	
					fout.write((char *) &yTemp, sizeof(yTemp));	
				}
		}
	catch(const std::exception& e)
		{
			std::cerr << e.what() << '\n';
			// Close the stream
			ifs.close();

			fout.close();
			return -1;
		}
	
	// Close the stream
	ifs.close();
	return 1;

}

int parseObjectOptionFile (char *file)
{
	ifstream ifs;
	ofstream fout;
	char filedirname[133];

	getNewFileName(filedirname, file);
	cout << filedirname << "\n";
	try
		{
			// Open the file or throw exeption
			ifs.open(file);
			if (ifs.fail()) throw;

			// Open the file for output
			fout.open(filedirname, ios::binary | ios::out);
			if (fout.fail()) throw;

			// Open stream to file
			std::stringstream ss;
			ss << ifs.rdbuf();

			// Read object to world data
			float object2world[16];
			for (uint32_t i=0; i < 16; i++)
				{
					ss >> object2world[i];
				}
			// Write to file
			fout.write((char *) &object2world, sizeof(object2world));

			// Read type
			uint32_t type;
			ss >> type;
			// Write to file
			fout.write((char *) &type, sizeof(type));

			// Read Index of refraction
			float ior;
			ss >> ior;
			// Write to file
			fout.write((char *) &ior, sizeof(ior));

			// Read albedo
			float albedo[3];
			for (uint32_t i=0; i < 3; i++)
				{
					ss >> albedo[i];
				}
			// Write to file
			fout.write((char *) &albedo, sizeof(albedo));

			// Read kd 
			float kd;
			ss >> kd;
			// Write to file
			fout.write((char *) &kd, sizeof(kd));

			// Read ks
			float ks;
			ss >> ks;
			// Write to file
			fout.write((char *) &ks, sizeof(ks));

			// Read n
			float n;
			ss >> n;
			// Write to file
			fout.write((char *) &n, sizeof(n));

		}
	catch(const std::exception& e)
		{
			std::cerr << e.what() << '\n';
			// Close the stream
			ifs.close();

			fout.close();
			return -1;
		}
	
	// Close the stream
	ifs.close();
	return 1;
}

int main(int argc, char **argv)
{

	int fun_check;

	// Check number of CLI arguments
	if ( argc < 2 )
		{
			cout << "Wrong number of arguments\n Must at least have a scene option data file" << std::endl;
			return -1;
		}

	// Parse .sod scene data from file and write in bytes 
	fun_check = parseSceneOptionFile( argv[1]);
	if (fun_check == -1)
		{
			cout << "ERROR: Parsing of scene option file failed\n";
			return -1;
		}

	// Read the number of objects 
	uint32_t numofobjects = atoi( argv[2]);

	uint32_t indexfactorgeo = 3;
	uint32_t indexfactorood = 4;
	
	// Iterate argv array for each objects geometry and options file
	for (uint32_t i=0; i < numofobjects; i++)
		{
			// Parse .geo geometry data from file and write in bytes
			fun_check = parseGeometryFile( argv[i+indexfactorgeo]);
			if (fun_check == -1)
				{
					cout << "ERROR: Parsing of object geometry file failed\n";
					return -1;
				}			
			// Parse .ood object option data from file and write in bytes 
			fun_check = parseObjectOptionFile( argv[i+indexfactorood]);
			if (fun_check == -1)
				{
					cout << "ERROR: Parsing of object option data file failed\n";
					return -1;
				}

			// Increment the factors to maintain +2 pattern for input files 
			indexfactorgeo++;
			indexfactorood++;		
		}	

	return 0;
}

# ProfileApp

Running the API.

1. Make sure python 3 is installed in the system.
2. Once the file is cloned move into the folder containing python scripts.
3. Create a virtual environment using the "python3 -m venv venv" command.
4. Activate the virtual environment using the ". venv/bin/activate" command.
5. Install flask and flask_restful using the "pip install flask" and "pip install flask_restful" command.
6. Once Flask is installed run the userdetails.py using python. The local host for the API will be ddisplayed and use "/userdetails" endpoint to get the desired json data.
7. Run the test.py script to see the output of unittest cases.

Running API on Docker

1. Make sure docker is installed.
2. Follow the same steps above to create a virtual environment.
3. The requirements file and the docker file is already present in the repo. Use the docker build command to create a docker image.
4. Use the docker images command to see the created images.
5. Use the docker run command to run the docker image and retrive the key.
6. Use the docker logs command elong with the key to run the API inside a docker container.

Running the iOS App

1. Once the API is up and running, open the project file using xcode.
2. Check if the local host url matches the url inside the APIManager file.
3. Run the file in xcode to see the application output.

<h1 align="center" href="#">Draws</h1>





[![Alt][home-page-screenshot]](https://example.cf)

## About The Project

   Siple SPA client, server & Mongo Atlass aplication based on **" 8 day learn Dart language, AngularDart and Shelf_router as server side framework challenge "**.

#### Currently in process of being hosted on [Heroku](https://example.cf) 


### Built With

:one: Client
* [AngularDart](https://angulardart.dev)
* [AngularRouter](https://angulardart.dev/guide/router)
* [Stagehand](https://pub.dev/packages/stagehand)
* [Materialize](https://materializecss.com/)
* [Dio](https://pub.dev/packages/dio)

:two: Server
* [Dart SDK](https://dart.dev/get-dart)
* [Shelf Router](https://pub.dev/packages/shelf_router)
* [webdev](https://dart.dev/tools/webdev)
* [Mongo-dart](https://github.com/mongo-dart/mongo_dart)
* [Envify](https://github.com/frencojobs/envify)
* [JSON Web Token (JWT)](https://pub.dev/packages/dart_jsonwebtoken)


### Installation


To get a local copy up and running follow these simple example steps.

:one: Download the app or clone the repo:

   :hash:  `` git clone https://github.com/Iskren1990/draw-client.git ``
    
   :hash:  `` git clone https://github.com/Iskren1990/draw_server.git ``


Note: Port 3000 and 8080 should not be in use. To validate follow the instructions bellow.

To use local MongoDB change "MONGO_URL" and "SUPER_SECRET_KEY" located in ".env".
 
:two: install Dart SDK and project packages

In the root folder of the client and server execute: 

   --Server--
    :hash: `` dart pub get ``


   --Client--
    :hash: `` dart pub global activate webdev ``
    :hash: `` dart pub get ``
    :hash: `` webdev serve ``
	

By default the project uses port 3000 and 8080.

 - to check if it is free for use:

   - In Windows open cmd and paste:


   :hash: `` netstat -aon | find '3000' ``
   
   :hash: `` netstat -aon | find '8080' ``
	

   - In Linux paste in the terminal:


   :hash: ```sh sudo netstat -anp | grep ':3000' ```
   
   :hash: ```sh sudo netstat -anp | grep ':8080' ```
	

If the port is in use by other software you can change it by:


 - open " .env " file.
 - change the value " PORT " variable.
	
	PORT=xxxx


## Getting Started


To start the server run:

   :hash: `` dart run ``

To start the client run:

   :hash: `` webdev serve ``

After successful start you will see the URL on which you can access the app.


## Usage

[![Alt][login-page-screenshot]](https://example.cf)

[![Alt][create-page-screenshot]](https://example.cf)


## Roadmap

See the [open issues](https://github.com/Iskren1990/draw-client/issues) for a list of proposed features (and known issues).

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## License

Distributed under the MIT License. See `LICENSE` for more information.


## Contact

Open a issue with request.


## Acknowledgements

   :hash: `` Great thanks to Creative Bracket, Dev Ed Mahmud Ahsan and freeCodeCamp for the tutorials! ``

* [Creative Bracket](https://www.youtube.com/channel/UCHSRZk4k6e-hqIXBBM4b2iA)
* [Dev Ed](https://www.youtube.com/watch?v=3GqUM4mEYKA&t=931s)
* [Mahmud Ahsan](https://www.youtube.com/watch?v=Ej_Pcr4uC2Q&t=22s)
* [freeCodeCamp](https://www.youtube.com/channel/UC8butISFwT-Wl7EV0hUK0BQ)



[home-page-screenshot]: http://res.cloudinary.com/allmighty/image/upload/v1620386625/HomePage_xxkjqu.png
[login-page-screenshot]: http://res.cloudinary.com/allmighty/image/upload/v1620386625/Form_ktxfio.png
[create-page-screenshot]: http://res.cloudinary.com/allmighty/image/upload/v1620386625/Create_nzfgrf.png
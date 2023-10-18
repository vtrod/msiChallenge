import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


/// página inciial do aplicativo após o login, que contém os botões para o funcionario realizar o
/// check-in, pausa, retorno (da pausa) e o check-out da obra
/// ao clicar, é lançado para um banco de dados firebase os dados de latitude, longitude, status (em obra e fora de obra) e o horario
/// que foi clicado em cada botão




class HomePage extends StatefulWidget {
  const HomePage({super.key});
//
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
///pegando permissão do usuario para localização
    Position? _currentLocation;
    late bool servicePermission = false;
    late LocationPermission permission;


    String _currentAddress = "";

    Future <Position> _getCurrentLocation() async {
      servicePermission = await Geolocator.isLocationServiceEnabled();
      if (!servicePermission) {
        print ("Serviço desabilitado");
      }
      permission = await Geolocator.checkPermission();
        if(permission == LocationPermission.denied){
        permission == await Geolocator.requestPermission();
        }
      return await Geolocator.getCurrentPosition();
    }

    _getAddressFromCoordinates() async {
      try{
        List<Placemark> placemarks = await placemarkFromCoordinates(_currentLocation!.latitude, _currentLocation!.longitude);

        Placemark place = placemarks[0];
        setState(() {
          _currentAddress = "${place.locality}, ${place.country}";
        });
      }catch (e){
        print(e);
      }
    }
    Future<void> _updateLocationAndAddress() async {
      _currentLocation = await _getCurrentLocation();
      await _getAddressFromCoordinates();
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Obra Prima'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),

            Text(
              "Endereço",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 6,
            ),

            Text(
              "${_currentAddress}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Text(
              "Coordenadas",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 6,
            ),

            Text(
              "${_currentLocation}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
             SizedBox(
               height: 100,
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    _currentLocation= await _getCurrentLocation();
                    await _getAddressFromCoordinates();
                    await _updateLocationAndAddress();
                    print("${_currentLocation}");

                    print("${_currentAddress}");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: Colors.black, width: 0.5),
                    ),
                      minimumSize: Size(150, 150)
                  ),
                  child: Text('Check-In', style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal
                  ),
                  ),
                ),
                SizedBox(width: 30), // Espaçamento entre os botões
                ElevatedButton(
                  onPressed: () {
                    // Adicione a lógica para o botão "Pausa" aqui
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[500], // Note que "bege" não é uma cor padrão, você pode personalizar a cor.
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: Colors.black, width: 0.5),
                    ),
                    minimumSize: Size(150, 150)
                  ),
                  child: Text('Pausa', style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal
                  ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30), // Espaçamento entre as linhas de botões
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Adicione a lógica para o botão "Retorno" aqui
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: Colors.black, width: 0.5),
                    ),
                      minimumSize: Size(150, 150)
                  ),
                  child: Text('Retorno', style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal
                  ),
                  ),
                ),
                SizedBox(width: 30), // Espaçamento entre os botões
                ElevatedButton(
                  onPressed: () {
                    // Adicione a lógica para o botão "Saída" aqui
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.withOpacity(0.8), // Use a cor "redAccent" para vermelho claro
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: Colors.black, width: 0.5),
                    ),
                      minimumSize: Size(150, 150)
                  ),
                  child: Text('Saída', style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'cupertino',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

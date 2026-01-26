function fn(){
const config = {
baseUrl: karate.properties['baseUrl'],
baseUrl2: karate.properties['baseUrl2'],
baseUrl3: karate.properties['baseUrl3'],
baseUrl4: karate.properties['baseUrl4'],
baseUrl4: karate.properties['baseUrl4'],

enviarToken: karate.properties['enviarToken']}

var baseUrl = karate.properties['baseUrl']
karate.log('baseUrl is: ', baseUrl)
var baseUrl2 = karate.properties['baseUrl2']
karate.log('baseUrl2 is: ', baseUrl2)

var baseUrl3 = karate.properties['baseUrl3']
karate.log('baseUrl3 is: ', baseUrl3)

var baseUrl4 = karate.properties['baseUrl4']
karate.log('baseUrl4 is: ', baseUrl4)

var baseUrl5 = karate.properties['baseUrl5']
karate.log('baseUrl5 is: ', baseUrl5)

karate.configure('connectTimeout', 30000);
karate.configure('readTimeout', 30000);
karate.configure('ssl', true);

return config;


}
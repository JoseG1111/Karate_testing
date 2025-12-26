function fn(){
const config = {
baseUrl: karate.properties['baseUrl'],
enviarToken: karate.properties['enviarToken']}

var baseUrl = karate.properties['baseUrl']
karate.log('baseUrl is: ', baseUrl)

karate.configure('connectTimeout', 30000);
karate.configure('readTimeout', 30000);
karate.configure('ssl', true);

return config;


}
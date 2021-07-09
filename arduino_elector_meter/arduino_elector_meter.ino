#include <ArduinoJson.h>

#include <PZEM004Tv30.h>

#include <WiFi.h>
#include <IOXhop_FirebaseESP32.h>

// Set your own Credentials. 
#define FIREBASE_HOST ""
#define FIREBASE_AUTH ""
#define WIFI_SSID ""
#define WIFI_PASSWORD ""

PZEM004Tv30 pzem(&Serial2);

bool enableLog = true;
int n = 0;
int delayInSec = 1;

float voltage, current, power, energy, frequency, pf;

void setup()
{
    Serial.begin(115200);
    connect_wifi();
    Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

void loop()
{
    n += delayInSec;

    voltage = pzem.voltage();
    if (isnan(voltage))
    {
        Serial.println("Error reading sensor data");
        Firebase.setString("error", "Error reading sensor data");
        logFBError();
        return; // no need read the rest of the values in case of error.
    }

    current = pzem.current();

    power = pzem.power();

    energy = pzem.energy();

    frequency = pzem.frequency();

    pf = pzem.pf();

    pushToFirebase();
    delay(delayInSec * 1000);
}

void pushToFirebase()
{
    // set value
    String msg = "Connected to WIFI & firebase since ";
    msg = msg + n;

    DynamicJsonBuffer jBuffer;
    JsonObject &root = jBuffer.createObject();
    root["voltage"] = voltage;
    root["current"] = current;
    root["power"] = power;
    root["energy"] = energy;
    root["frequency"] = frequency;
    root["pf"] = pf;

    Firebase.set("/stats", root);
    logFBError();
}

void logFBError()
{
    // print out firebase errors if any
    if (Firebase.failed())
    {
        Serial.print("setting /number failed:");
        Serial.println(Firebase.error());
    }
}

void connect_wifi()
{
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    Serial.print("connecting");
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.print(".");
        delay(500);
    }
    Serial.println();
    Serial.print("connected: ");
    Serial.println(WiFi.localIP());
}

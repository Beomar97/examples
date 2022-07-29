import { registerRootComponent } from 'expo'
import React, { useState } from 'react'
import { StyleSheet, Text, View, TextInput, Button } from 'react-native'
import Forecast from './Forecast'

registerRootComponent(App)

export default function App() {
  const [location, setLocation] = useState('')
  const [forecast, setForecast] = useState(null)

  const apiKey = '???'

  const getForecast = async (location) => {
    try {
      const response = await fetch(
        `https://api.openweathermap.org/data/2.5/weather?q=${location}&units=metric&appid=${apiKey}`
      )
      const json = await response.json()
      console.log(json)
      setForecast({
        name: json.name,
        main: json.weather[0].main,
        description: json.weather[0].description,
        temp: Math.round(json.main.temp),
        tempMin: Math.round(json.main.temp_min),
        tempMax: Math.round(json.main.temp_max),
        icon: json.weather[0].icon,
      })
    } catch (error) {
      console.error(error)
    }
  }

  return (
    <View style={styles.container}>
      <View style={styles.backdrop}>
        <View style={styles.overlay}>
          <Text style={styles.mainText}>Current weather for</Text>
          <View style={styles.locationContainer}>
            <TextInput
              style={[styles.locationCode, styles.mainText]}
              value={location}
              onChangeText={(text) => {
                setLocation(text)
              }}
            />
            <Button onPress={() => getForecast(location)} title="Search" />
          </View>
          {forecast !== null && (
            <Forecast
              style={styles.forecast}
              name={forecast.name}
              main={forecast.main}
              description={forecast.description}
              temp={forecast.temp}
              tempMin={forecast.tempMin}
              tempMax={forecast.tempMax}
              icon={forecast.icon}
            />
          )}
        </View>
      </View>
    </View>
  )
}

let baseFontSize = 16

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
  },
  backdrop: {
    flex: 1,
    paddingTop: Platform.OS === 'ios' ? 40 : 0,
    backgroundColor: '#0093E9',
    alignSelf: 'stretch',
  },
  background: {
    position: 'absolute',
    left: 0,
    right: 0,
    top: 0,
    height: 300,
  },
  overlay: {
    paddingTop: 5,
    backgroundColor: '#000000',
    opacity: 0.5,
    flexDirection: 'column',
    alignItems: 'center',
  },
  mainText: {
    fontSize: baseFontSize,
    color: '#FFFFFF',
  },
  locationContainer: {
    borderBottomColor: '#DDDDDD',
    borderBottomWidth: 1,
    marginLeft: 5,
    marginTop: 3,
    marginBottom: 15,
  },
  locationCode: {
    width: 100,
    height: baseFontSize + 25,
  },
})

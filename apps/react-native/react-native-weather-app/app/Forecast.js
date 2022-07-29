import React from 'react'
import { StyleSheet, Text, View, Image } from 'react-native'

const Forecast = ({
  name,
  main,
  description,
  temp,
  tempMin,
  tempMax,
  icon,
}) => {
  const capitalize = (s) => {
    return s.charAt(0).toUpperCase() + s.slice(1)
  }

  return (
    <View>
      <Text style={styles.nameText}>{name}</Text>
      <Text style={styles.tempText}>{temp}°</Text>
      <View style={styles.container}>
        <Image
          style={styles.image}
          source={{
            uri: 'http://openweathermap.org/img/wn/' + icon + '@2x.png',
          }}
        />
        <Text style={styles.mainText}>{main}</Text>
      </View>
      <Text style={styles.mainText}>{`H:${tempMax}° L:${tempMin}°`}</Text>
      <Text style={styles.mainText}>{capitalize(description)}</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
  },
  nameText: {
    fontSize: 28,
    textAlign: 'center',
    color: '#FFFFFF',
  },
  tempText: {
    fontSize: 72,
    textAlign: 'center',
    color: '#FFFFFF',
  },
  mainText: {
    fontSize: 20,
    textAlign: 'center',
    color: '#FFFFFF',
  },
  image: {
    width: 60,
    height: 60,
  },
})

export default Forecast

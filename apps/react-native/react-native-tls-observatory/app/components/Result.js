import React from "react";
import { StyleSheet, Text, View, TouchableOpacity } from "react-native";

export default function Result(props) {
  return (
    <TouchableOpacity
      style={styles.button}
      activeOpacity={0.7}
      onPress={() => {
        props.setCurrentCipher(props.cipher);
        props.navigation.push("Cipher Details");
      }}
    >
      <View style={styles.container}>
        <Text style={styles.title}>Cipher: {props.title}</Text>
        <Text style={styles.title}>Code: {props.description}</Text>
      </View>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 12,
    borderBottomWidth: 1,
  },
  title: {
    color: "#4A90E2",
    fontSize: 24,
  },
  button: {
    padding: 10,
  },
});

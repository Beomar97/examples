import { registerRootComponent } from 'expo';
import React, { useState } from 'react'
import { StyleSheet, Text, View, Modal, TouchableOpacity } from 'react-native';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';


export default function App() {

  const [roll, setRoll] = useState<number>(0)
  const [dice, setDice] = useState<number>(0)

  const [rollModal, setRollModal] = useState(false)
  const [rollModalButton, setRollModalButton] = useState(false)
  const [rollDisplay, setRollDisplay] = useState<number>(0)

  const rollDice = (currentDice: number) => {
    setDice(currentDice)
    setRollModal(true)

    let counter = 0;
    const rollInterval = setInterval(() => {
      counter += 1
      const currentRoll = Math.floor(Math.random() * currentDice) + 1
      setRollDisplay(currentRoll);
      if(counter >= 10) {  
        clearInterval(rollInterval)
        setRoll(currentRoll)
        setRollModalButton(true)
      }
    }, 100);
  }

  return (
    <View style={styles.container}>
      <Modal
        transparent={true}
        visible={rollModal}
        onRequestClose={() => {
          setRollModal(!rollModal);
          setRollModalButton(!rollModalButton);
        }}
      >
        <View style={styles.centeredView}>
          <View style={styles.modalView}>
            <Text style={styles.rollDisplay}>{`Rolled with D${dice}:`}</Text>
            <Text style={styles.rollDisplay}>{rollDisplay}</Text>
            {
              rollModalButton &&
              <View style={styles.buttonGroup}>
                <TouchableOpacity
                style={[styles.button, styles.buttonAgain]}
                activeOpacity={0.7}
                onPress={() => rollDice(dice)}
                >
                  <Text style={styles.buttonTextStyle}>Roll again</Text>
                </TouchableOpacity>
                <TouchableOpacity
                style={[styles.button, styles.buttonClose]}
                activeOpacity={0.7}
                onPress={() => {
                  setRollModal(!rollModal);
                  setRollModalButton(!rollModalButton);
                }}
                >
                  <Text style={styles.buttonTextStyle}>Close</Text>
                </TouchableOpacity>
              </View>
            }
          </View>
        </View>
      </Modal>
      <Text style={styles.title}>Ultimate{"\n"}D&D Dice Roller</Text>
      <TouchableOpacity
        style={styles.rollButton}
        activeOpacity={0.7}
        onPress={() => rollDice(4)}
      >
        <Icon name="dice-d4" size={40} />
        <Text style={styles.rollButtonText}>Roll D4</Text>
      </TouchableOpacity>
      <TouchableOpacity
        style={styles.rollButton}
        activeOpacity={0.7}
        onPress={() => rollDice(6)}
      >
        <Icon name="dice-d6" size={40} />
        <Text style={styles.rollButtonText}>Roll D6</Text>
      </TouchableOpacity>
      <TouchableOpacity
        style={styles.rollButton}
        activeOpacity={0.7}
        onPress={() => rollDice(8)}
      >
        <Icon name="dice-d8" size={40} />
        <Text style={styles.rollButtonText}>Roll D8</Text>
      </TouchableOpacity>
      <TouchableOpacity
        style={styles.rollButton}
        activeOpacity={0.7}
        onPress={() => rollDice(10)}
      >
        <Icon name="dice-d10" size={40} />
        <Text style={styles.rollButtonText}>Roll D10</Text>
      </TouchableOpacity>
      <TouchableOpacity
        style={styles.rollButton}
        activeOpacity={0.7}
        onPress={() => rollDice(12)}
      >
        <Icon name="dice-d12" size={40} />
        <Text style={styles.rollButtonText}>Roll D12</Text>
      </TouchableOpacity>
      <TouchableOpacity
        style={styles.rollButton}
        activeOpacity={0.7}
        onPress={() => rollDice(20)}
      >
        <Icon name="dice-d20" size={40} />
        <Text style={styles.rollButtonText}>Roll D20</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: 42,
    padding: 12,
    textAlign: 'center',
  },
  rollButton: {
    width: 200,
    borderRadius: 20,
    backgroundColor: '#35baf6',
    elevation: 2,
    padding: 10,
    marginBottom: 10,
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-around'
  },
  rollButtonText: {
    fontSize: 18,
    padding: 12,
  },
  rollDisplay: {
    fontSize: 28,
  },
  centeredView: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    marginTop: 22
  },
  modalView: {
    margin: 20,
    backgroundColor: "white",
    borderRadius: 20,
    padding: 35,
    alignItems: "center",
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2
    },
    shadowOpacity: 0.25,
    shadowRadius: 4,
    elevation: 5
  },
  buttonGroup: {
    flexDirection: 'row',
    alignItems: "center",
  },
  button: {
    borderRadius: 20,
    padding: 10,
    marginTop: 10,
    marginHorizontal: 10,
    elevation: 2,
  },
  buttonAgain: {
    backgroundColor: "#357a38",
  },
  buttonClose: {
    backgroundColor: "#ab003c",
  },
  buttonTextStyle: {
    color: "white",
    fontWeight: "bold",
    textAlign: "center"
  },
});

registerRootComponent(App);

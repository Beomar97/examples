import "react-native-gesture-handler";
import { useState } from "react";
import {
  FlatList,
  StyleSheet,
  Text,
  View,
  TextInput,
  Button,
} from "react-native";
import Result from "./components/Result";
import { createStackNavigator } from "@react-navigation/stack";
import { NavigationContainer } from "@react-navigation/native";
import { NativeBaseProvider, Input } from "native-base";

const Root = createStackNavigator();

export default function App() {
  const [text, setText] = useState("www.umb.ch");
  const [scan, setScan] = useState("");
  const [ciphers, setCiphers] = useState([]);
  const [currentCipher, setCurrentCipher] = useState(null);

  const requestScan = async (server) => {
    try {
      const response = await fetch(
        `https://tls-observatory.services.mozilla.com/api/v1/scan?target=${server}&rescan=false`,
        {
          method: "POST",
        }
      );
      const json = await response.json();
      getResults(json.scan_id);
    } catch (error) {
      console.error(error);
    }
  };

  const getResults = async (scanId) => {
    try {
      const response = await fetch(
        `https://tls-observatory.services.mozilla.com/api/v1/results?id=${scanId}`
      );
      const json = await response.json();
      console.log(json);
      setScan(json);
      setCiphers(json.connection_info.ciphersuite)
    } catch (error) {
      console.error(error);
    }
  };

  const SearchPage = ({ navigation, route }) => (
    <View style={styles.container}>
      <Text style={styles.title}>TLS Observatory</Text>
      <View style={styles.searchBar}>
        <Input placeholder="Search" variant="filled" width="100%" borderRadius="10" py="1" px="2" borderWidth="0" value={text} onChangeText={(text) => {
            setText(text);
          }}    
        />
      <Button title="🔍" color="white" onPress={() => {
          requestScan(text);
          navigation.push("Detected Ciphers");
        }} />
        </View>
    </View>
  );

  const ListPage = ({ navigation, route }) => (
    <View style={styles.screen}>
      <View style={styles.detail}>
        <Text>Id: {scan.id}</Text>
        <Text>Timestamp: {scan.timestamp}</Text>
        <Text>Target: {scan.target}</Text>
        { scan.connection_info && 
          <>
            <Text>IP: {scan.connection_info.scanIP}</Text>
          </>
        }
      </View>
      <FlatList
          data={ciphers}
          keyExtractor={(item) => item.code}
          renderItem={({ item }) => (
            <Result
              title={item.cipher}
              description={item.code}
              navigation={navigation}
              cipher={item}
              setCurrentCipher={setCurrentCipher}
            />
          )}
      />
      </View>
  )

  const DetailsPage = ({ navigation, route }) => (
    <View style={styles.screen}>
      <Text style={styles.title}>Cipher Details</Text>
      <View style={styles.detail}>
        <Text>Cipher: {currentCipher.cipher || ""}</Text>
        <Text>Code: {currentCipher.code || ""}</Text>
        <Text>PubKey: {currentCipher.pubkey || ""}</Text>
        <Text>Sign Algorithm: {currentCipher.sigalg || ""}</Text>
        {
          currentCipher.curves && 
          currentCipher.curves.map((curve) => <Text key={curve}>Curve: {curve}</Text>)
        }
        {
          currentCipher.protocols && 
          currentCipher.protocols.map((protocol) => <Text key={protocol}>Protocol: {protocol}</Text>)
        }
      </View>
    </View>
  );

  return (
    <NativeBaseProvider>
      <NavigationContainer>
        <Root.Navigator>
          <Root.Screen name="Analyze Server" component={SearchPage} />
          <Root.Screen name="Detected Ciphers" component={ListPage} />
          <Root.Screen name="Cipher Details" component={DetailsPage} />
        </Root.Navigator>
      </NavigationContainer>
    </NativeBaseProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 50,
  },
  row: {
    padding: 15,
    marginBottom: 5,
    backgroundColor: "skyblue",
  },
  title: {
    fontWeight: "bold",
    fontSize: 36,
    padding: 15,
  },
  detail: {
    fontSize: 12,
    padding: 15,
  },
  input: {
    fontSize: 24,
  },
  searchBar: {
    flexDirection: "row",
    paddingLeft: "10%",
    paddingRight: "10%"
  },
  searchButton: {
    height: "20%",
    resizeMode: "cover",
  },
});

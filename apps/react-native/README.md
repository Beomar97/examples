# React Native

## Basics

Application logic is written and runs in **JavaScript** (React). It runs on a JavaScript engine (JavaScriptCore or Hermes). The **bridge** translates JS calls and invokes the host platform's underlying APIs and UI elements. The Application UI is **fully native**.

React Native API is mostly the same as React for the web. A highly functional approach to constructing user interfaces. Application UI is expressed as a function of the current application state.

Why not just use the Mobile browser? It lacks many capabilities. Native platform widgets and gestures are not available. The look and feel of native apps are not possible.

iOS and Android are different on many fundamental levels. Writing a single app that runs on both platforms is not the goal of React Native. Some areas overlap; React Native will handle the differences and provide unified components where possible.

Styles are written as JavaScript objects. Babel is used for preprocessing JavaScript.

```react
import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';

export default function Project() {
  return (
    <View style={styles.container}>
      <Text style={styles.welcome}>
        Welcome to React Native!
      </Text>
      <Text style={styles.instructions}>
        To get started, edit index.ios.js
      </Text>
      <Text style={styles.instructions}>
        Press Cmd+R to reload,{'\n'}
        Cmd+D or shake for dev menu
      </Text>
    </View>
); }
AppRegistry.registerComponent('Project', () => Project);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
}, welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
}, });
```

There are two options to create a React Native project:

- **Expo CLI**

  Command-line tool for quickly starting a new React Native project.

  The app can be directly tested on a device by installing the Expo Client on iOS or Android. Only JavaScript or TypeScript is written in Expo. Expo tools and services take care of the rest. Default the **managed workflow** is set up; it is possible to eject the **bare workflow** by running `expo eject`, giving complete control over every aspect of the native project.

- **React Native CLI**

  Create complete iOS and Android projects if you need to build native code in your project.

  Based on platform-specific development tools and libraries. Xcode, iOS Simulator, Android Studio. It can be tricky.

**Core Components** can be used out of the box. Nearly all extend the `View` component. An optional `style` prop can be passed to them. Flexbox is used to specify the layout.

| HTML       | React Native          |
| ---------- | --------------------- |
| div        | View                  |
| img        | Image                 |
| span, p    | Text                  |
| ul, ol, li | FlatList, SectionList |

**View** is the most fundamental building block. Abstraction layer on top of the platform's native equivalent. They are used for the styling and layout of children's elements.

```react
<View style={styles.container}>
	<View style={styles.box} />
</View>
```

**Text** components may have plain text nodes as children.

```react
<View>
	<Text>This is some Text!</Text>
</View>
```

**Button** is a basic button component. Renders nicely on any platform—only minimal level of customisation.

```react
<Button
  onPress={onPressLearnMore}
  title="Learn More"
  color="#841584"
  accessibilityLabel="Learn more about this purple button"
/>
```

**Image** renders images and comes bundled with the app as assets or downloaded from the web. **ImageBackground** can be used alternatively.

```react
<Image
	style={styles.image}
	source={{ uri: 'https://www.reactnative.express/static/logo.png' }}
/>
```

**Scrollview** is used for scrollable content and is suited for scrolling small quantities of content (< 30 items). A *List* should be considered for large amounts of items.

```react
<ScrollView style={styles.container}>
	<View style={styles.large} />
	<View style={styles.small} />
	<View style={styles.large} />
</ScrollView>
```

**Lists** are used for large quantities of scrollable content. It only renders the content on-screen (improves performance). Can scroll horizontally or vertically.

**FlatList** is the new recommended list component for simple, performant lists.

```react
<FlatList
	style={styles.container}
	data={items}
	renderItem={({ item }) => <Text style={styles.row}>{item.text}</Text>}
	keyExtractor={(item) => item.id}
/>
```

**SectionList** is the same as a *FlatList*, but with section headers.

In React Native, a subset of CSS is implemented to keep the **styling** API narrow. Completely different positioning and no support for pseudoclasses, animations or selectors. JavaScript-based style objects are part of the components themselves.

**Inline Styles** can be used but are usually not the best way. Syntactically is the simplest way to style components—no access to subtags such as `strong` and `em`.

```react
<Text>
  The quick <Text style={{fontStyle: "italic"}}>brown</Text> fox
  jumped over the lazy <Text style={{fontWeight: "bold"}}>dog</Text>.
</Text>
```

**Styling with plain objects** can be useful if styles should be mutable.

```react
var italic = { fontStyle: 'italic' };
var bold   = { fontWeight: 'bold'  };
...
<Text>
	The quick <Text style={italic}>brown</Text> fox
	jumped over the lazy <Text style={bold}>dog</Text>.
</Text>
```

**Reusable components** can be defined for styling text using `Stylesheet.create` to create stylesheets. Style inheritance is limited; use styled-components.

```react
var styles = StyleSheet.create({
	bold: {
		fontWeight: "bold"
	}
});
...
<Text style={styles.bold}>
	{children}
</Text>
```

**Style Concatenation:**

```react
<Text style={[styles.button, styles.accentText, {color: '#FFFFFF'}]}>
  {this.props.children}
</Text>
```

**Conditional Styles:**

```react
<View style={[styles.button, this.state.touching && styles.highlight]} />
```

## Components and APIs

**Navigation** allows the application to transition between different screens. Various challenges for a cross-platform solution, and the original API was removed from core React Native. The most popular community solution is **React Navigation** (https://reactnavigation.org/).

```react
import { createStackNavigator } from '@react-navigation/stack'
import { NavigationContainer } from '@react-navigation/native'

const Root = createStackNavigator()

export default function App() {
  return (
    <NavigationContainer>
      <Root.Navigator>
        <Root.Screen name="Screen1" component={Screen1} />
        <Root.Screen name="Screen2" component={Screen2} />
      </Root.Navigator>
    </NavigationContainer>
  )
}

const Screen1 = ({ navigation, route }) => (
  <View style={styles.screen}>
    <Text style={styles.title}>Screen 1</Text>
    <Button
      title="Go to Screen 2"
      onPress={() => {
        navigation.push('Screen2')
      }}
		/>
	</View>
)
```

**TouchableHighlight** is a wrapper for making views respond appropriately to touches. It causes an overlay to appear when the view is touched, giving visual feedback.

```react
<TouchableHighlight
  onPressIn={this.onPressIn}
  onPressOut={this.onPressOut}
  style={styles.touchable}>
    <View style={styles.button}>
      <Text style={styles.welcome}>
        {this.state.pressing ? 'EEK!' : 'PUSH ME'}
      </Text>
    </View>
</TouchableHighlight>
```

Two APIs exist for custom **Touch and Gestures** handling:

- **GestureHandler** (Expo) provides an API for handling complex gestures.
- **PanResponder** provides a useful abstraction for the gesture responder system.

For **platform-specific versions** of components, an extension `.ios.js` or `.android.js` can be added. The packager will automatically select the correct implementation. Alternatively, the Platform module (https://reactnative.dev/docs/platform) can be used.

**Platform APIs** make it easy to access the phone's camera roll, location or persistent storage. React Native does not have all of its host platform's functionality. Some APIs will require custom modules or community-written modules. Cross-platform is a work in progress.

For **Location**, the Geolocation API extends the Geolocation web spec. But has been removed from the React Native core APIs. Alternatives are **react-native-location** (https://github.com/timfpark/react-native-location) or **expo-location** (https://docs.expo.io/versions/latest/sdk/location/).

```react
import * as Location from 'expo-location';
async function getPos (setLocation) {
    let { status } = await Location.requestPermissionsAsync();
    if (status !== 'granted') {
      setErrorMsg('Permission to access location was denied');
			return;
    }
    let location = await Location.getCurrentPositionAsync({});
    setLocation(location);
}
```

Access to the local camera roll/gallery has been removed from the React Native core APIs. Alternatives are **react-native-cameraroll** (https://github.com/react-native-cameraroll/react-native-cameraroll) or **Media Library** (Expo) (https://docs.expo.dev/versions/latest/sdk/media-library/).

**AsyncStorage** is similar to *LocalStorage* on the web. Provides an asynchronous, unencrypted, persistent, key-value storage API. Has been removed from the React Native core APIs. Alternative: https://reactnative.directory/?search=storage.

```react
import AsyncStorage from '@react-native-async-storage/async-storage'
const storeData = async (value) => {
  try {
    const jsonValue = JSON.stringify(value)
    await AsyncStorage.setItem('@storage_Key', jsonValue)
  } catch (e) {
    // saving error
	}
}
```

**Fetch API** provided by React Native for networking needs (https://reactnative.dev/docs/network#using-fetch).

```react
const getMoviesFromApi = () => {
  return fetch('https://reactnative.dev/movies.json')
    .then((response) => response.json())
    .then((json) => {
      return json.movies;
   })
   .catch((error) => {
      console.error(error);
		});
};
```

## Roundup, Redux

There are several ways to manage data throughout an app. The best choice depends on the complexity of the app.

**Component State:** Storing data in the state of the components. Uses function props to update state in parent components. Therefore it is advantageous to maintain the state in the root component.

**Redux:** A predictable state container. Store object maintains the application state and can notify React components when state changes happen (http://redux.js.org/).

The **State Tree** is a single object containing everything that changes in the application, including the data and the UI state.

The State Tree is read-only. For **State Changes**, actions need to be dispatched. An action is a plain JS object describing the change, which must have a type property.

```js
{ type: 'ADD_TODO', text: 'hey', id: 125 }
{ type: 'TOGGLE_TODO', id: 125 }
```

Redux requires that certain functions are **pure**. Return values depend only on the values of their arguments and no side effects like network or database calls. Use pure functions by **avoiding array mutations** and **avoiding object mutations**.

The **Reducer** function takes the previous state and the action being dispatched. Returns the next state of the application. Does not notify the state given to it.

```js
(state, action) => newState
```

**Reducer Composition:** Reducers can be composed of other reducers.

```react
const todos = (state = [], action) => {
  switch (action.type) {
    case 'ADD_TODO':    return [...state, todo(undefined, action)]
    case 'TOGGLE_TODO': return state.map(t => todo(t, action))
    default: return state
	}
}
```

Helper function `combineReducers()`:

```react
const { combineReducers } = Redux;
const todoApp = combineReducers({
  todos,
  visibilityFilter
})
```

**Redux Store:**

```react
const { createStore } = Redux
const store = createStore(counter)

document.addEventListener('click', () => {
  store.dispatch({ type: 'INCREMENT' })
})

const render = () => {
  document.body.innerText = store.getState()
}

store.subscribe(render)
render()
```

**Store Methods:**

- `getState()` retrieves the current state of the Redux store.
- `dispatch()` is how we dispatch actions to change the state.
- `subscribe()` registers a callback that will be called when an action has been dispatched.

**Deployment** depends on the development option:

- React Native CLI:

  Android: https://reactnative.dev/docs/signed-apk-android

  iOS: https://reactnative.dev/docs/publishing-to-app-store

- Expo CLI:

  Expo Application Service (EAS): https://expo.dev/eas

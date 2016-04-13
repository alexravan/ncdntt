/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */

import React, {
  AppRegistry,
  Component,
  StyleSheet,
  Text,
  View
} from 'react-native';

class mobile extends Component {
  componentDidMount() {
    this.apicall();
  }
  render() {
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
    );
  }

  apicall() {
    var params={
        title: 'Im stuck in a phone!!!',
        user_id: 1,
        category_id: 1,
        severity: 7,
        location: 'Carm common room',
        description: 'test',
    }
    var formData = new FormData();
    for (var k in params) {
      formData.append(k, params[k]);
    }
    var request={
      method: 'POST',
      headers: {},
      body: formData
    }
    fetch('https://ncdntt.herokuapp.com/api/createincident', request)
    .then((response) => response.text())
    .then((responseText) => {
      console.log(responseText);
    })
    .catch((error) => {
      console.warn(error);
    });
  }


}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('mobile', () => mobile);

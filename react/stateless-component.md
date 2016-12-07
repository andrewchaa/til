```javascript
import React, { Component } from 'react';
import { Modal, StyleSheet, Text, TextInput, TouchableHighlight, View } from 'react-native';

 const StationModal = (props) => {
    return (
      <Modal
        animationType={"slide"}
        transparent={false}
        visible={props.visible}
        onRequestClose={() => {alert("Modal has been closed.")}}
        >
       <View style={{marginTop: 22}}>
        <View>
        <TextInput
          style={{height: 40, borderColor: 'gray', borderWidth: 1}}
          onChangeText={(text) => props.selectStation(text)}
          value={props.station}

        />


          <TouchableHighlight onPress={() => {
            props.close();
          }}>
            <Text>Hide Modal</Text>
          </TouchableHighlight>

        </View>
       </View>
      </Modal>
    )
}

export default StationModal
```

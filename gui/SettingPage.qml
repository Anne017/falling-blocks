import QtQuick 2.2
import Ubuntu.Components 1.1
import Ubuntu.Components.ListItems 1.0 as ListItem
import "../logic/game.js" as Game

Page {
    signal init
    Column {
        spacing: units.gu(2)
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: units.gu(2)
        ListItem.Header {
            text: i18n.tr("Begin level:")
        }
        TextField {
            id: startingLevel
            enabled: !values.started
            placeholderText:  "1-15"
            validator: IntValidator{bottom: 1; top: 15;}
            anchors {
                left: parent.left; right: parent.right
            }
        }
        Binding {
            target: values
            property: "startingLevel"
            value: parseInt(startingLevel.text)?parseInt(startingLevel.text):1
        }
        ListItem.Header {
            text: i18n.tr("Drop sensitivity:")
        }
        Slider {
            id: sensitivity
            anchors {
                left: parent.left; right: parent.right
            }
            live: false
            value: 5
            minimumValue: 1
            maximumValue: 9
        }
        Binding {
            target: values
            property: "sensitivity"
            value: sensitivity.value
            when: initiated
        }
        ListItem.Standard {
            text: i18n.tr("Debug")
            control: Switch {
                id: debug
                checked: false
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Binding {
            target: values
            property: "debug"
            value: debug.checked
        }
    }
}

import QtQuick 2.2
import Ubuntu.Components 1.1

UbuntuShape {
    color: "black"
    gradientColor: UbuntuColors.coolGrey
    opacity: 0.91
    z: 100
    Label {
        anchors.centerIn: parent
        text: i18n.tr("Paused")
        color: "white"
        fontSize: "large"
    }
}

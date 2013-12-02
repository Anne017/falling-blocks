import QtQuick 2.0
import Ubuntu.Components 0.1
import "gui"
import "logic/game.js" as Game

MainView {
    width: units.gu(50)
    height: units.gu(80)

    headerColor: UbuntuColors.darkAubergine
    backgroundColor: UbuntuColors.midAubergine
    footerColor: UbuntuColors.warmGrey

    focus: true

    applicationName: "com.ubuntu.developer.labsin.fallingblocks"

    automaticOrientation: true

    QtValues {
        id: values
        onGameOverChanged: {
            if(gameOver) {

            }
        }
    }

    Database {
        id:mainDbObj
    }

    PageStack {
        id: stack
        Component.onCompleted: push(tabs)

        Tabs {
            id: tabs
            visible: false

            Tab {
                title: i18n.tr("FallingBlocks")
                page: BlocksPage {
                    id: gamePage
                }
            }

            Tab {
                title: i18n.tr("Highscores")
                page: HighscorePage {
                    id: highscorePage
                }
            }

            onCurrentPageChanged: {
                if(currentPage!=1 && values.running==true) {
                    values.paused = true;
                }
            }

        }

        SettingPage {
            id: settingPage
            title: i18n.tr("Settings")
            visible: false
        }

    }

    Component.onCompleted: {
        Game.valuesObject = values;

        gamePage.init()

        Keys.forwardTo = values.gameCanvas

        Game.init();
    }
}

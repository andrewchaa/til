# Getting started with Sentry

For react native: https://docs.sentry.io/platforms/react-native/

    # install
    npm install --save @sentry/react-native

    # run sentry wizard
    npx @sentry/wizard -i reactNative -p ios android

    cd ios
    pod install
    
    # configure
    import * as Sentry from "@sentry/react-native";

    Sentry.init({
      dsn: "https://examplePublicKey@o0.ingest.sentry.io/0",
    });
    

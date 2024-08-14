# FactFinder
This app uses VisionKit and BERT to scan for text and allow the user to find info on the text

# Text Query iOS App

![App Demo](path_to_your_gif.gif) <!-- Replace with the actual path to your GIF -->

## Overview

Text Query is an iOS app that allows users to capture text from an image, convert it into digital text, and then query that text using a BERT-based model. The app processes text directly on-device, ensuring privacy and speed, while leveraging CoreML and Vision frameworks for state-of-the-art machine learning and text recognition capabilities.

## Features

- **Text Recognition**: Capture text from images using your iPhone's camera and convert it into digital text.
- **Natural Language Processing**: Query the extracted text using a pre-trained BERT model to get accurate answers to your questions.
- **On-Device Processing**: All processing is done on-device using CoreML, ensuring your data stays private and the app runs efficiently.

## Installation

1. **Clone the Repository**:
    ```bash
    git clone git@github.com:Rafiq6581/FactFinder.git
    cd FactFinder
    ```

2. **Open in Xcode**:
    - Open the `.xcodeproj` file in Xcode.

3. **Install Dependencies**:
    - Make sure you have Xcode 15.4 or later installed.

4. **Build and Run**:
    - Connect your iPhone and select it as the build target.
    - Press `Cmd + R` to build and run the app on your device.
    - Note: There may be additional steps if you are running an iOS app on your iPhone for the first time.

## How It Works

1. **Capture Text**:
    - Use the camera to take a picture of an object, a document or anything that has text on it such as legal documents or a food packaging. 
    - The Vision framework extracts the text and converts it into digital format.

2. **Query the Text**:
    - Enter a question related to the captured text.
    - The app uses a BERT model to process the query and extract the most relevant answer.

3. **View the Results**:
    - The app provides the answer in a text box above the query TextField.

## Usage Example

1. **Take a Picture**:
    - Open the app and tap on the Scan Icon. This will bring you to your camera view. You will be asked to allow the app to use the camera when you run the app for the first time.

2. **Process the Text**:
    - Once you have captured the image. Tap on "Generate Text" and the app will automatically bring you the main page with the scanned text revealed in the top Text box.

3. **Ask a Question**:
    - Type your query in the search bar at the very bottom of the main view, and the app will provide an answer based on the recognized text.

## License

This project is licensed under the Apple Inc for the BERT-SQuAD model - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Apple](https://developer.apple.com/) for providing the CoreML and Vision frameworks.
- The BERT model used in this app is licensed under Apache 2.0, and the Question-Answering dataset is distributed under Creative Commons Attribution-ShareAlike 4.0 International.

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## Contact

For any questions or suggestions, please contact [rifhanrosman@gmail.com](mailto:your-email@example.com).



import SwiftUI
import Shared
import os.signpost
import os.log

let logHandler = OSLog(subsystem: "com.nasirimehr.testing", category: "qos-measuring")

class ImageManipulator {
  // other properties, like the logHandle
  let signpostID = OSSignpostID(log: logHandler)
    let id = UUID().uuidString

  func start() {
      os_signpost(.begin, log: logHandler, name: "Processing", signpostID: signpostID, "begin processing for %{public}s", id)
    // do things
  }

  func end() {
    os_signpost(.end, log: logHandler, name: "Processing", signpostID: signpostID, "finished processing for %{public}s", id)
  }
}

struct ContentView: View {
    @State private var showContent = false
    let imageManipulator = ImageManipulator()
    var body: some View {
        VStack {
            Button("Click me!") {
                imageManipulator.start()
                withAnimation {
                    showContent = !showContent
                }
                imageManipulator.end()
            }

            if showContent {
                VStack(spacing: 16) {
                    Image(systemName: "swift")
                        .font(.system(size: 200))
                        .foregroundColor(.accentColor)
                    Text("SwiftUI: \(Greeting().greet())")
                }
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

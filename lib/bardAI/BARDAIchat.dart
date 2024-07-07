import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:phantom/bardAI/BardAIController.dart';

class BardAIChat extends StatelessWidget {
  const BardAIChat({super.key});

  @override
  Widget build(BuildContext context) {
    BardAIController controller = Get.put(BardAIController());
    TextEditingController textField = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xfff2f1f9),
      appBar: AppBar(
        centerTitle: true,
        leading: SvgPicture.asset(
          "assets/bard_logo.svg",
          width: 10,
        ),
        title: const Text(
          "BARD",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                controller.sendPrompt("Hello what can you do for me ");
              },
              icon: Icon(
                Icons.lightbulb,
                color: Colors.orange,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                          Text("Welcome to PDF ALL IN ONE ask some thing  ❤️ "),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                          "😍 How can i be a best software developer in just"),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("💡"),
                    ),
                  ],
                ),
                Obx(() => Column(
                      children: controller.historyList
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Text(e.system == "user" ? "👨‍💻" : "🤖"),
                                  SizedBox(width: 10),
                                  Flexible(child: Text(e.message)),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ))
              ],
            )),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: textField,
                    decoration: InputDecoration(
                        hintText: "You can ask what you want",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? CircularProgressIndicator()
                      : IconButton(
                          onPressed: () {
                            if (textField.text != "") {
                              controller.sendPrompt(textField.text);
                              textField.clear();
                            }
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          )),
                ),
                SizedBox(width: 10)
              ]),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class MedicalChatScreen extends StatefulWidget {
  const MedicalChatScreen({super.key});

  @override
  State<MedicalChatScreen> createState() => _MedicalChatScreenState();
}

class _MedicalChatScreenState extends State<MedicalChatScreen> {
  String apiKey = "AIzaSyCqfjba_QPQTkwMWqgiuibna3eZJKi7KhY"; // IMPORTANT: Replace with your actual Gemini API Key

  @override
  void initState() {
    super.initState();
    // It's a good practice to load the API key from a secure source
    // rather than hardcoding it, especially for production apps.
    // For this demo, we'll keep it simple.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.grey.withOpacity(0.2),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/statoscope-medical-3d-icon-png.webp',  // Place your image here (in assets folder)
                height: 32,
              ),
              const SizedBox(width: 8),
              const Text(
                "Medical ChatBot",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/statoscope-medical-3d-icon-png.webp'),
              ),
            )
          ],
        ),
      body: LlmChatView(
          suggestions: const [
            "I've been feeling dizzy lately. What now?",
            "How do I know if I need to see a doctor?",
            "What should I eat to boost my immunity?"
          ],
          style: LlmChatViewStyle(
            backgroundColor: Colors.white,
            chatInputStyle: ChatInputStyle(
              hintText: "Enter your message",
              decoration: const BoxDecoration().copyWith(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          provider: GeminiProvider(
            model: GenerativeModel(
              model: "gemini-2.0-flash",
              apiKey: apiKey,
              systemInstruction: Content.system(
                "You are a professional medical health assistant. Only respond to health and medically related questions and make them concise and straight to the point without too much explanation."
                    "If a question is unrelated to health or medicine, politely inform the user that you can only answer medical-related queries.",
              ),
            ),
          ),
          welcomeMessage:
          "Hello👋 I’m here to help with your medical questions. Please tell me how I can assist you."
      ),
    );
  }
}
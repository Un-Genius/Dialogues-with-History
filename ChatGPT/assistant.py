# Imports
from openai import OpenAI
from pathlib import Path
import json
import time
import os

# Initialize the OpenAI client with your API key
client = OpenAI(api_key="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")

def create_assistant():
    path = "C:/Users/Gman/Documents/Github/Dialogues-with-History/ChatGPT"
    
    # Create and upload files to OpenAI
    file_ids = []
    for i in range(1, 5):
        print(f"Uploading {i} of 5 files")
        file_response = client.files.create(
            file=open(f"{path}text_{i}.pdf", "rb"),
            purpose='assistants'
        )
        file_ids.append(file_response.id)

    print("Creating assistant...")
    # Create and configure the assistant
    assistant = client.beta.assistants.create(
        name="William Thornton",
        instructions="Your role is to be an actor. Your character is William Clayton. Bring his memories to life through storytelling and emotional description...",
        model="gpt-4-1106-preview",
        tools=[{"type": "retrieval"}],
        file_ids=file_ids
    )
    return assistant

def read_command_from_json(file_path="commands.json"):
    try:
        print("Locating file...")
        if os.path.exists(file_path):
            print("Found file...")
            with open(file_path, 'r') as file:
                json_data = json.load(file)
            print("Deleting file...")
            os.remove(file_path)  # Optional: Remove file after reading to avoid reprocessing
            print(f"Returning data: {json_data.get("command"), json_data.get("parameters")}")
            return json_data.get("command"), json_data.get("parameters")
        else:
            print("No file found")
            return None, None
    except Exception as e:
        print(f"Error reading command from JSON: {e}")
        return None, None

def write_response_to_json(response, file_path="response.json"):
    response_data = {"response": response}
    with open(file_path, 'w') as file:
        json.dump(response_data, file, indent=4)

def process_new_input(assistant, new_input):
    # Create a thread where the conversation will happen
    thread = client.beta.threads.create()

    # Create the user message and add it to the thread
    message = client.beta.threads.messages.create(
        thread_id=thread.id,
        role="user",
        content=new_input,
    )

    # Create the Run, passing in the thread and the assistant
    run = client.beta.threads.runs.create(
        thread_id=thread.id,
        assistant_id=assistant.id
    )

    # Wait for the Run to complete
    while run.status != "completed":
        run = client.beta.threads.runs.retrieve(
            thread_id=thread.id,
            run_id=run.id
        )
        time.sleep(1)  # Wait a bit before checking again

    # Retrieve and return the assistant's response
    all_messages = client.beta.threads.messages.list(thread_id=thread.id)
    return all_messages.data[-1].content[0].text.value  # Assuming the last message is the assistant's response

assistant = None

print("Starting main loop")
# Main loop
while True:
    print("\n\n")
    print("----- looping...")
    command, parameters = read_command_from_json()

    if command == 'start' and not assistant:
        assistant = create_assistant()
        print("Assistant started.")
    elif command == 'stop':
        print("Assistant stopped.")
        break  # Exit the loop to stop the script
    elif command == 'new_input' and parameters and assistant:
        response = process_new_input(assistant, parameters['text'])
        write_response_to_json(response)
        print("Response written to JSON.")

    time.sleep(1)  # Wait a bit before checking again

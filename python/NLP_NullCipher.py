#!/usr/bin/env python3
import random
import spacy
'''
The algorythic complexity to generate N offset null type ciphers is low.
The complexity in generating them, to sound like reasonable messages is high.
This is another attempt at a null cipher generator, this time using NLP.

Put your text to encipher into core.txt in the same folder.
'''
# Load the NLP model
nlp = spacy.load("en_core_web_sm")

def parse_message(message):
    """Parse the message and return characters after the last period."""
    sentences = message.split(".")
    if len(sentences) > 1:
        return sentences[-1].strip()
    return message.strip()

def find_matching_word(core_words, character, index):
    """Find a word from core.txt where the character at position index matches."""
    matches = [word for word in core_words if len(word) > index and word[index] == character]
    return random.choice(matches) if matches else None

def generate_text_with_insertions(message, core_words, offset=2):
    """Generate a new body of text using the core word list and message indices."""
    parsed = parse_message(message)
    output_text = []

    for i, char in enumerate(parsed):
        if char.isalpha():
            word = find_matching_word(core_words, char, offset)
            if word:
                output_text.append(word)
            else:
                output_text.append(char)  # Fallback to the original char
        else:
            output_text.append(char)

    # Turn into a sentence
    text = " ".join(output_text)
    doc = nlp(text)
    # Make it more grammatical
    return " ".join([sent.text for sent in doc.sents])

# Load the core.txt file
with open("core.txt", "r") as file:
    core_words = file.read().splitlines()

# Example usage
message = "Hello world. This is an example sentence."
output = generate_text_with_insertions(message, core_words, offset=1)
print("Generated Text:", output)


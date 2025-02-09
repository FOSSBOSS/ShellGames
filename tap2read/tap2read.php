<?php
// Directory containing PDF files
$pdfDir = "docs"; // Update this to the correct folder path if needed

// Ensure the directory exists
if (!is_dir($pdfDir)) {
    die("Directory not found!");
}

// Get all PDF files in the directory
$pdfFiles = glob("$pdfDir/*.pdf");

// Check if any PDF files exist
if (empty($pdfFiles)) {
    die("No PDF files found in the directory.");
}

// Pick a random PDF file
$randomPDF = $pdfFiles[array_rand($pdfFiles)];

// Set headers to display PDF directly
header("Content-Type: application/pdf");
readfile($randomPDF);
?>

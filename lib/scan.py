from flask import Flask, request, jsonify
from flask_cors import CORS
from PIL import Image
import pytesseract
import io
import re

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# Path to your Tesseract-OCR installation
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

# Define your job titles here
job_titles = [
    'Manager', 'Director', 'Engineer', 'Specialist', 'Consultant', 'Analyst', 'Coordinator',
    'Developer', 'Architect', 'Leader', 'Technician', 'Officer', 'Administrator', 'Associate',
    'Designer', 'Programmer', 'Producer', 'Assistant', 'Executive', 'Strategist', 'Chief',
    'Head', 'Supervisor', 'Trainer', 'Planner', 'Representative', 'Writer', 'Auditor',
    'Educator', 'Teacher', 'Scientist', 'Strategist', 'Support Specialist', 'Partner', 'Controller',
    'Moderator', 'Principal', 'President', 'Secretary', 'Entrepreneur', 'Salesperson', 'Buyer',
    'Operator', 'Recruiter', 'Agent', 'Consultant', 'Researcher', 'Advisor', 'Administrator',
    'Lead', 'Partner', 'Consultant', 'Educator', 'Trainer', 'Scientist', 'Strategist',
    'Developer', 'Programmer', 'Support Specialist', 'Manager', 'Director', 'Engineer',
    'Specialist', 'Consultant', 'Analyst', 'Coordinator', 'Developer', 'Architect', 'Leader',
    'Technician', 'Officer', 'Administrator', 'Associate', 'Designer', 'Programmer', 'Producer',
    'Assistant', 'Executive', 'Strategist', 'Chief', 'Head', 'Supervisor', 'Trainer',
    'Planner', 'Representative', 'Writer', 'Consultant', 'Auditor', 'Administrator', 'Engineer',
    'Researcher', 'Advisor', 'Officer', 'Head', 'Administrator', 'Moderator', 'Controller',
    'Principal', 'President', 'Secretary', 'Entrepreneur', 'Salesperson', 'Buyer', 'Controller',
    'Operator', 'Recruiter', 'Agent'
]

def recognize_text(image):
    # Perform OCR on the image
    text = pytesseract.image_to_string(image)
    list_text = [line.strip() for line in text.splitlines() if line.strip()]
    return list_text

def extract_website(string):
    url_pattern = re.compile(
        r'(https?://)?(www\.)?([a-zA-Z0-9_-]+\.)+[a-zA-Z]{2,6}(/[\w_-]*)*',
        re.IGNORECASE
    )
    match = url_pattern.search(string)
    return match.group(0) if match else 'couldnt find'

def extract_email(s):
    pattern = re.compile(r'[\w\.-]+@[\w\.-]+')
    match = pattern.search(s)
    return match.group(0) if match else 'couldnt find'

def extract_phone_number(s):
    cleaned_s = re.sub(r'[^\d+]', '', s)
    pattern = re.compile(r'(\+\d{1,3})?\d{10,12}')
    match = pattern.search(cleaned_s)
    if match:
        number = match.group(0)
        if len(number) > 10:
            number = number[-10:]
        return number
    return 'couldnt find'

def extract_full_position(s):
    sorted_titles = sorted(job_titles, key=len, reverse=True)
    for title in sorted_titles:
        if title.lower() in s.lower():
            return s
    return 'couldnt find'

def extract_company(s):
    company_suffixes = [
        r'\bPvt\.?\b', r'\bLtd\.?\b', r'\bCo\.?\b', r'\bBrothers\b', r'\bSons\b',
        r'\bIncorporated\b', r'\bLLC\b', r'\bCorporation\b', r'\bInc\b', r'\bGroup\b',
        r'\bAssociates\b', r'\bEnterprises\b'
    ]
    company_pattern = re.compile(r'(\b[A-Za-z0-9]+(?:\s[A-Za-z0-9]+)*\s(?:' + '|'.join(company_suffixes) + r'))',
                                 re.IGNORECASE)
    match = company_pattern.search(s)
    return match.group(0) if match else 'couldnt find'

def update_info_dict(data_list, info_dict):
    remaining_values = []

    for item in data_list:
        email = extract_email(item)
        if email:
            info_dict['email'] = email
            data_list.remove(item)
            break
    else:
        info_dict['email'] = 'couldnt find'

    for string in data_list:
        website_string = extract_website(string)
        if website_string != 'couldnt find':
            info_dict['website'] = website_string
            data_list.remove(string)
            break
    else:
        info_dict['website'] = 'couldnt find'

    for item in data_list:
        phone_number = extract_phone_number(item)
        if phone_number and phone_number != 'couldnt find':
            info_dict['number'] = phone_number
            data_list.remove(item)
            break
    else:
        info_dict['number'] = 'couldnt find'

    for item in data_list:
        position = extract_full_position(item)
        if position != 'couldnt find':
            info_dict['position'] = position
            data_list.remove(item)
            break
    else:
        info_dict['position'] = 'couldnt find'

    for item in data_list:
        company = extract_company(item)
        if company != 'couldnt find':
            info_dict['company'] = company
            data_list.remove(item)
            break
    else:
        info_dict['company'] = 'couldnt find'

    remaining_values = data_list
    return remaining_values

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    try:
        img = Image.open(io.BytesIO(file.read()))
        list_text = recognize_text(img)

        # Remove false data
        final_lines_list = [line for line in list_text if len(line) >= 6]
        final_lines_list = list(set(final_lines_list))

        output_dict = {
            'name': '',
            'position': '',
            'number': '',
            'email': '',
            'location': '',
            'website': '',
            'company': ''
        }

        remaining_values = update_info_dict(final_lines_list, output_dict)

        return jsonify({
            'info': output_dict,
            'remaining_values': remaining_values
        })

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')  # Allow external connections

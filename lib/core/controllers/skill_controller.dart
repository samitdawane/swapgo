import 'package:get/get.dart';
import 'package:swapgo/data/models/skill_category.dart';

class SkillController extends GetxController {
  var selectedCategory = ''.obs; // Track selected category
  var selectedSkills = <String>{}.obs; // Track selected skills

  List<SkillCategory> categories = [
    SkillCategory(
      categoryName: 'Programming Languages',
      skills: ['Java', 'C++', 'R Programming'],
    ),
    SkillCategory(
      categoryName: 'Data Skills',
      skills: [
        'Excel',
        'Power BI',
        'Tableau',
        'MATLAB',
        'Data Analysis',
        'Data Visualization',
        'Big Data',
      ],
    ),
    SkillCategory(
      categoryName: 'Software',
      skills: ['AutoCAD', 'SolidWorks', 'SAP', 'Tally'],
    ),
    SkillCategory(
      categoryName: 'Language',
      skills: [
        'English',
        "Hindi"
            "Tamil",
        "Telugu",
        "Kannada",
        "Bengali",
        "Marathi",
        "French",
        "German",
        "Spanish",
      ],
    ),
    SkillCategory(
      categoryName: 'HR',
      skills: [
        'Talent Acquisition',
        'Payroll',
        'Compliance',
        'Employee Engagement',
        'HRMS',
        'Training & Development',
        'Performance Management',
        'Onboarding',
        'Exit Interviews',
      ],
    ),
    SkillCategory(
      categoryName: 'Soft Skills',
      skills: [
        'Communication',
        'Leadership',
        'Teamwork',
        'Problem-solving',
        'Time Management',
        'Presentation Skills',
      ],
    ),
    SkillCategory(
      categoryName: 'Sales',
      skills: [
        'CRM',
        'Lead Generation',
        'B2B Sales',
        'B2C Sales',
        'Negotiation',
      ],
    ),
    SkillCategory(
      categoryName: 'Tools & Platforms',
      skills: [
        'Git',
        'Docker',
        'Jenkins',
        'Kubernetes',
        'Salesforce',
        'AWS',
        'Azure',
      ],
    ),
    SkillCategory(
      categoryName: 'Web Technologies',
      skills: ['HTML', 'CSS', 'React', 'Angular', 'Node.js'],
    ),
    SkillCategory(
      categoryName: 'Finance',
      skills: [
        'Financial Analysis',
        'Auditing',
        'Budgeting',
        'Taxation',
        'MS Excel (Advanced)',
        'Forecasting',
        'SAP FICO',
        'Cost Accounting',
        'Payroll Management',
      ],
    ),
  ];

  // Set the selected category
  void selectCategory(String category) {
    if (selectedCategory.value == category) {
      selectedCategory.value = ''; // Deselect if it's already selected
    } else {
      selectedCategory.value = category;
    }
  }

  // Toggle skill selection
  void toggleSkill(String skill) {
    if (selectedSkills.contains(skill)) {
      selectedSkills.remove(skill);
    } else {
      selectedSkills.add(skill);
    }
  }

  void resetSelections() {
    selectedSkills.clear();
    selectedCategory.value = '';
  }

  void clearSelectedSkills() {
    selectedSkills.clear();
  }
}

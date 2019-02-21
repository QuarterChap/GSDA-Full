//
//  EnrollExpandedDuty.swift
//  GSDA
//
//  Created by Julian Cearley on 2/19/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class EnrollExpandedDuty: UIViewController {
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor.white
        sv.alpha = 1
        sv.bounces = true
        sv.alwaysBounceVertical = true
        sv.alwaysBounceHorizontal = false
        sv.layer.zPosition = 0
        
        return sv
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enroll In Expanded Duty"
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.textAlignment = .center
        
        return label
    }()
    
    let label1: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Terms & Conditions"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor(r: 124, g: 128, b: 49)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Late Payments"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Installment payments not received 10 days after the due date shall incur a five percent (5%) penalty of the amount due"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label4: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cancellation and Refund Policy"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label5: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rejection"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label6: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "An applicant rejected by the school is entitled to a refund of all monies paid."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label7: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Three-Day Cancellation"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label8: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The application fee will not be refunded if within two weeks of the course start date."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label9: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "An applicant who provides written notice of cancellation within three days (excluding Saturday, Sunday and federal or state holidays) of signing an enrollment agreement is entitled to a refund of all monies paid. No later than 30 days of receiving the notice of cancellation, the school shall provide the 100% refund."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label10: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Other Cancellations"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label11: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "An applicant requesting cancellation more than three days after signing an enrollment agreement and making an initial payment, but prior to entering the school, is entitled to a refund of all monies paid less the $100.00 application fee and $100 deposit fee."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label12: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Prodedure for Withdrawl/Withdrawl Date"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label13: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "● A student choosing to withdraw from the school after the commencement of classes is to provide written notice to the Director of the school. The notice is to indicate the expected last date of attendance and be signed and dated by the student."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label14: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "● For a student who is on authorized Leave of Absence, the withdraw date is the date the student was scheduled to return from the Leave and failed to do so."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label15: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "● A student will be determined to be withdrawn from the institution if the student has not attended any class for 6 consecutive class hours."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label16: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "● All refunds will be issued within 30 days of the determination of the withdrawal date (less the $100.00 application fee and $100 deposit fee)."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label17: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tuition Charges/Refunds"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label18: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "● Before the beginning of classes, the student is entitled to a refund of 100% of the tuition less $100.00 application fee and $100 deposit"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label19: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "● After the commencement of classes, the tuition refund amount less $100 application fee and $100 deposit fee shall be determined as follows:"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label20: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "● Refunds are determined based on the proration of tuition and percentage of program completed at withdrawal, up until 50% of the program. The percentage of the clock hours attempted is determined by dividing the total number of clock hours elapsed from the student’s start date to the student’s last day of attendance, by the total number of clock hours in the program (less the $100.00 application/ $100 deposit fee)."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label21: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Privacy"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label22: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Georgia School of Dental Assisting is committed to protecting your privacy. We constantly review our systems and data to ensure the best possible service to our customers. Unauthorized activity against computer systems and data is against the law.  Georgia School of Dental Assisting will investigate any such activity and seek legal action against those responsible to recover any damages."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label23: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Books and Supplies"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label24: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "There is no refund for any equipment, books and supplies received by the student."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label25: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Refunds will be issued within 30 days of the date of student notification, or date of school determination (withdrawn due to absences or other criteria as specified in the school catalog), or in the case of a student not returning from an authorized Leave of Absence (LOA), within 30 days of the date the student was scheduled to return from the LOA and did not return."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label26: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Special Cases"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label27: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "In case of prolonged illness or accident, death in the family, or other circumstances that make it impractical for the student to complete the program, the school may make a settlement which is reasonable and fair (this language optional)."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label28: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Holder in Due Course Statement"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label29: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Any holder of this consumer credit contract is subject to all claims and defenses which the debtor could assert against the seller of goods or services obtained pursuant hereto or with the proceeds, hereof Recovery hereunder by the debtor shall not exceed amounts paid by the debtor (FTC Rule effective 5-14-76)."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label30: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Agreement & Deposit"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor(r: 124, g: 128, b: 49)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label31: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The Student Understands"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label32: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1. The school does not accept credit for previous education, training, work experience (experimental learning), or CLEP (if applicable)."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label33: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2. The School does not guarantee job placement to graduates upon program/course completion or upon graduation."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label34: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3. The School reserves the right to reschedule the program start date when the number of students scheduled is too small."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label35: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4. The School will not be responsible for any statement of policy or procedure that does not appear in the School catalog."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label36: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5. The School reserves the right to discontinue any students’ training for unsatisfactory progress, nonpayment of tuition or failure to abide by School rules."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label37: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "6. Information concerning other Schools that may accept the School’s credits toward their programs can be obtained by contacting the office of the President. It should not be assumed that any programs described in the School catalog could be transferred to another institution. The School does not guarantee the transferability of credits to a college, university or institution. Any decision on the comparability, appropriateness and applicability of credits and whether they should be accepted is the decision of the receiving institution."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label38: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7. This document does not constitute a binding agreement until accepted in writing by all parties."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label39: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Student Acknowledgements"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label40: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1. I hereby acknowledge receipt of the GSDA’s school catalog dated January 1 2012, which contains information describing programs offered, and equipment/supplies provided. The school ‘s 2015/2016 catalog is included as a part of this enrollment agreement, and I acknowledge that I have received a copy of this catalog."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label41: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2. Also, I have carefully read and received an exact copy of this enrollment agreement."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label42: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3. I understand that the School may terminate my enrollment if I fail to comply with attendance, academic and financial requirement or if I disrupt the normal activities of the School. While enrolled in the School, I understand that I must maintain Satisfactory Academic Progress as described in the School catalog and that my financial obligation to the School must be paid in full before a certificate may be awarded."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label43: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4. I also understand that this institution does not guarantee job placement to graduates upon program/course completion or upon graduation."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label44: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contract Acceptance"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label45: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "I, the undersigned, have read and understand this agreement and acknowledge receipt of a copy. It is further understood and agreed that this agreement supersedes all prior or contemporaneous verbal or written agreements and may not be modified without the written agreement of the student and the School Official. I also understand that if I default upon this agreement I will be responsible for payment of any collection fees or attorney fees incurred by Georgia School of Dental Assisting, LLC."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label46: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My signature below signifies that I have read and understand all aspects of this agreement and do recognize my legal responsibilities in regard to this contract."
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let label47: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "⚠ Complete your enrollment by filling out the form below. The enrollment agreement is mandatory to secure a space in the program."
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.backgroundColor = UIColor(r: 247, g: 247, b: 214)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        
        return label
    }()
    
    let label48: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Expanded Duty"
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    // Start Date & Location *
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupScrollView()
    }
    
    func setupView() {
        self.view.addSubview(scrollView)
        self.view.addSubview(backButton)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 10)
        
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.925).isActive = true
    }
    
    func setupScrollView() {
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(label1)
        scrollView.addSubview(label2)
        scrollView.addSubview(label3)
        scrollView.addSubview(label4)
        scrollView.addSubview(label5)
        scrollView.addSubview(label6)
        scrollView.addSubview(label7)
        scrollView.addSubview(label8)
        scrollView.addSubview(label9)
        scrollView.addSubview(label10)
        scrollView.addSubview(label11)
        scrollView.addSubview(label12)
        scrollView.addSubview(label13)
        scrollView.addSubview(label14)
        scrollView.addSubview(label15)
        scrollView.addSubview(label16)
        scrollView.addSubview(label17)
        scrollView.addSubview(label18)
        scrollView.addSubview(label19)
        scrollView.addSubview(label20)
        scrollView.addSubview(label21)
        scrollView.addSubview(label22)
        scrollView.addSubview(label23)
        scrollView.addSubview(label24)
        scrollView.addSubview(label25)
        scrollView.addSubview(label26)
        scrollView.addSubview(label27)
        scrollView.addSubview(label28)
        scrollView.addSubview(label29)
        scrollView.addSubview(label30)
        scrollView.addSubview(label31)
        scrollView.addSubview(label32)
        scrollView.addSubview(label33)
        scrollView.addSubview(label34)
        scrollView.addSubview(label35)
        scrollView.addSubview(label36)
        scrollView.addSubview(label37)
        scrollView.addSubview(label38)
        scrollView.addSubview(label39)
        scrollView.addSubview(label40)
        scrollView.addSubview(label41)
        scrollView.addSubview(label42)
        scrollView.addSubview(label43)
        scrollView.addSubview(label44)
        scrollView.addSubview(label45)
        scrollView.addSubview(label46)
        scrollView.addSubview(label47)
        scrollView.addSubview(label48)
        
        titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: view.frame.height * 0.05).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label1.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label2.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label3.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.115).isActive = true
        label3.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label4.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label4.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.135).isActive = true
        label4.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label5.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label5.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label5.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label6.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label6.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label6.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label7.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label7.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label7.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label8.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label8.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label8.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label8.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label9.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label9.topAnchor.constraint(equalTo: label8.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label9.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.275).isActive = true
        label9.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label10.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label10.topAnchor.constraint(equalTo: label9.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label10.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label10.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label10.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label11.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label11.topAnchor.constraint(equalTo: label10.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label11.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label11.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.275).isActive = true
        label11.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label12.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label12.topAnchor.constraint(equalTo: label11.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label12.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label12.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label12.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label13.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label13.topAnchor.constraint(equalTo: label12.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label13.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label13.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        label13.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label14.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label14.topAnchor.constraint(equalTo: label13.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label14.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label14.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        label14.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label15.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label15.topAnchor.constraint(equalTo: label14.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label15.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label15.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label15.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label16.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label16.topAnchor.constraint(equalTo: label15.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label16.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label16.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label16.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label17.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label17.topAnchor.constraint(equalTo: label16.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label17.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label17.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label17.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label18.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label18.topAnchor.constraint(equalTo: label17.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label18.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label18.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label18.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label19.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label19.topAnchor.constraint(equalTo: label18.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label19.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label19.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label19.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label20.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label20.topAnchor.constraint(equalTo: label19.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label20.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label20.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.375).isActive = true
        label20.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label21.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label21.topAnchor.constraint(equalTo: label20.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label21.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label21.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label21.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label22.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label22.topAnchor.constraint(equalTo: label21.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label22.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label22.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        label22.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label23.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label23.topAnchor.constraint(equalTo: label22.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label23.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label23.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label23.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label24.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label24.topAnchor.constraint(equalTo: label23.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label24.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label24.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        label24.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label25.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label25.topAnchor.constraint(equalTo: label24.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label25.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label25.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.325).isActive = true
        label25.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label26.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label26.topAnchor.constraint(equalTo: label25.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label26.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label26.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label26.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label27.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label27.topAnchor.constraint(equalTo: label26.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label27.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label27.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        label27.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label28.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label28.topAnchor.constraint(equalTo: label27.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label28.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label28.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label28.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label29.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label29.topAnchor.constraint(equalTo: label28.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label29.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label29.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        label29.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label30.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label30.topAnchor.constraint(equalTo: label29.bottomAnchor, constant: view.frame.height * 0.05).isActive = true
        label30.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label30.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label30.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label31.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label31.topAnchor.constraint(equalTo: label30.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label31.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label31.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label31.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label32.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label32.topAnchor.constraint(equalTo: label31.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label32.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label32.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label32.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label33.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label33.topAnchor.constraint(equalTo: label32.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label33.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label33.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        label33.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label34.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label34.topAnchor.constraint(equalTo: label33.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label34.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label34.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label34.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label35.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label35.topAnchor.constraint(equalTo: label34.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label35.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label35.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        label35.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label36.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label36.topAnchor.constraint(equalTo: label35.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label36.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label36.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label36.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label37.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label37.topAnchor.constraint(equalTo: label36.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label37.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label37.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.525).isActive = true
        label37.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label38.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label38.topAnchor.constraint(equalTo: label37.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label38.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label38.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        label38.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
    
        label39.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label39.topAnchor.constraint(equalTo: label38.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label39.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label39.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        label39.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label40.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label40.topAnchor.constraint(equalTo: label39.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label40.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label40.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.325).isActive = true
        label40.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label41.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label41.topAnchor.constraint(equalTo: label40.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label41.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label41.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        label41.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label42.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label42.topAnchor.constraint(equalTo: label41.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label42.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label42.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.375).isActive = true
        label42.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label43.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label43.topAnchor.constraint(equalTo: label42.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label43.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label43.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label43.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label44.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label44.topAnchor.constraint(equalTo: label43.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label44.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label44.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        label44.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        label45.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label45.topAnchor.constraint(equalTo: label44.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label45.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label45.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.475).isActive = true
        label45.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label46.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label46.topAnchor.constraint(equalTo: label45.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        label46.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label46.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label46.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label47.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label47.topAnchor.constraint(equalTo: label46.bottomAnchor, constant: view.frame.height * 0.05).isActive = true
        label47.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label47.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label47.font = UIFont.systemFont(ofSize: view.frame.width * 0.05)
        
        label48.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label48.topAnchor.constraint(equalTo: label47.bottomAnchor, constant: view.frame.height * 0.05).isActive = true
        label48.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label48.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095).isActive = true
        label48.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
    }
    
    @objc func handleBack() {
        self.dismiss(animated: true) {}
    }
    
}

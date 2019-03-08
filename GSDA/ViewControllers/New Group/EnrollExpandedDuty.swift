//
//  EnrollExpandedDuty.swift
//  GSDA
//
//  Created by Julian Cearley on 2/22/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

enum LabelType {
    case info
    case subject
    case header
}

class EnrollExpandedDuty: UIViewController {
    
    let scrollView = UIScrollView().configured {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.bounces = true
        $0.alwaysBounceVertical = true
        $0.alwaysBounceHorizontal = false
        $0.backgroundColor = UIColor.white
    }
    
    let backButton = UIButton().configured {
        $0.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        $0.setTitle("Back", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        $0.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 1
    }
    
    let titleLabel = UILabel().configured() {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Enroll In Expanded Duty"
        $0.textColor = UIColor.black
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScrollView()
    }
    
    func setupView() {
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height *
            3)
        
        self.view.addSubview(scrollView)
        self.view.addSubview(backButton)
        
        backButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: 00).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.925).isActive = true
    }
    
    func createLabels(with dict: [String: LabelType]) {
        var labels = [UILabel]()
        
        for (text, type) in dict {
            switch (type) {
            case .info:
                let label = InfoLabel()
                label.text = text
                labels.append(label)
            case .subject:
                let label = SubjectLabel()
                label.text = text
                labels.append(label)
            case .header:
                let label = HeaderLabel()
                label.text = text
                labels.append(label)
            }
        }
        
        
        
        func calculateInfoLabelHeight(for text: String, with fontHeight: Int) -> CGFloat {
            // check screen width for this
            // if 5s else if 6 else if 6plus
            
            return CGFloat(text.count/1000 * 40)
        }
        
        func setConstraints() {
            for label in labels {
                if let infoLabel = label as? InfoLabel {
                    //set constraints for info label
                    let calculatedHeight = calculateInfoLabelHeight(for: infoLabel.text!, with: 0)
                    infoLabel.heightAnchor.constraint(equalToConstant: calculatedHeight).isActive = true
                    infoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
                    infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                    // top anchor to the bottom of the previous anchor with a mulitplier distance between each one
                    
                } else if let subjectLabel = label as? SubjectLabel {
                    
                } else if let headerLabel = label as? HeaderLabel {
                    
                }
            }
        }
    }
    
    func setupScrollView() {
        scrollView.addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: view.frame.height * 0.05).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        
        createLabels(with: ["Terms & Conditions" : .header])
        createLabels(with: ["Late Payments" : .subject])
        createLabels(with: ["Installment payments not received 10 days after the due date shall incur a five percent (5%) penalty of the amount due" : .info])
        createLabels(with: ["Cancellation and Refund Policy" : .subject])
        createLabels(with: ["Rejection" : .subject])
        createLabels(with: ["An applicant rejected by the school is entitled to a refund of all monies paid." : .info])
        createLabels(with: ["Three-Day Cancellation" : .subject])
        createLabels(with: ["The application fee will not be refunded if within two weeks of the course start date." : .info])
        createLabels(with: ["An applicant who provides written notice of cancellation within three days (excluding Saturday, Sunday and federal or state holidays) of signing an enrollment agreement is entitled to a refund of all monies paid. No later than 30 days of receiving the notice of cancellation, the school shall provide the 100% refund." : .info])
        createLabels(with: ["Other Cancellations" : .subject])
        createLabels(with: ["An applicant requesting cancellation more than three days after signing an enrollment agreement and making an initial payment, but prior to entering the school, is entitled to a refund of all monies paid less the $100.00 application fee and $100 deposit fee." : .info])
        createLabels(with: ["Prodedure for Withdrawl/Withdrawl Date" : .subject])
        createLabels(with: ["● A student choosing to withdraw from the school after the commencement of classes is to provide written notice to the Director of the school. The notice is to indicate the expected last date of attendance and be signed and dated by the student." : .info])
        createLabels(with: ["● For a student who is on authorized Leave of Absence, the withdraw date is the date the student was scheduled to return from the Leave and failed to do so." : .info])
        createLabels(with: ["● A student will be determined to be withdrawn from the institution if the student has not attended any class for 6 consecutive class hours." : .info])
        createLabels(with: ["● All refunds will be issued within 30 days of the determination of the withdrawal date (less the $100.00 application fee and $100 deposit fee)." : .info])
        createLabels(with: ["Tuition Charges/Refunds" : .subject])
        createLabels(with: ["● Before the beginning of classes, the student is entitled to a refund of 100% of the tuition less $100.00 application fee and $100 deposit" : .info])
        createLabels(with: ["● After the commencement of classes, the tuition refund amount less $100 application fee and $100 deposit fee shall be determined as follows:" : .info])
        createLabels(with: ["● Refunds are determined based on the proration of tuition and percentage of program. completed at withdrawal, up until 50% of the program. The percentage of the clock hours attempted is determined by dividing the total number of clock hours elapsed from the student’s start date to the student’s last day of attendance, by the total number of clock hours in the program (less the $100.00 application/ $100 deposit fee)." : .info])
        createLabels(with: ["Privacy" : .subject])
        createLabels(with: ["Georgia School of Dental Assisting is committed to protecting your privacy. We constantly review our systems and data to ensure the best possible service to our customers. Unauthorized activity against computer systems and data is against the law.  Georgia School of Dental Assisting will investigate any such activity and seek legal action against those responsible to recover any damages." : .info])
        createLabels(with: ["Books and Supplies" : .subject])
        createLabels(with: ["There is no refund for any equipment, books and supplies received by the student." : .info])
        createLabels(with: ["Refunds will be issued within 30 days of the date of student notification, or date of school determination (withdrawn due to absences or other criteria as specified in the school catalog), or in the case of a student not returning from an authorized Leave of Absence (LOA), within 30 days of the date the student was scheduled to return from the LOA and did not return." : .info])
        createLabels(with: ["Special Cases" : .subject])
        createLabels(with: ["In case of prolonged illness or accident, death in the family, or other circumstances that make it impractical for the student to complete the program, the school may make a settlement which is reasonable and fair (this language optional)." : .info])
        createLabels(with: ["Holder in Due Course Statement" : .subject])
        createLabels(with: ["Any holder of this consumer credit contract is subject to all claims and defenses which the debtor could assert against the seller of goods or services obtained pursuant hereto or with the proceeds, hereof Recovery hereunder by the debtor shall not exceed amounts paid by the debtor (FTC Rule effective 5-14-76)." : .info])
        
        createLabels(with: ["Agreement & Deposit" : .header])
        createLabels(with: ["The Student Understands" : .subject])
        createLabels(with: ["1. The school does not accept credit for previous education, training, work experience (experimental learning), or CLEP (if applicable)." : .info])
        createLabels(with: ["2. The School does not guarantee job placement to graduates upon program/course completion or upon graduation." : .info])
        createLabels(with: ["3. The School reserves the right to reschedule the program start date when the number of students scheduled is too small." : .info])
        createLabels(with: ["4. The School will not be responsible for any statement of policy or procedure that does not appear in the School catalog." : .info])
        createLabels(with: ["5. The School reserves the right to discontinue any students’ training for unsatisfactory progress, nonpayment of tuition or failure to abide by School rules." : .info])
        createLabels(with: ["6. Information concerning other Schools that may accept the School’s credits toward their programs can be obtained by contacting the office of the President. It should not be assumed that any programs described in the School catalog could be transferred to another institution. The School does not guarantee the transferability of credits to a college, university or institution. Any decision on the comparability, appropriateness and applicability of credits and whether they should be accepted is the decision of the receiving institution." : .info])
        createLabels(with: ["7. This document does not constitute a binding agreement until accepted in writing by all parties." : .info])
        createLabels(with: ["Student Acknowledgements" : .subject])
        createLabels(with: ["1. I hereby acknowledge receipt of the GSDA’s school catalog dated January 1 2012, which contains information describing programs offered, and equipment/supplies provided. The school ‘s 2015/2016 catalog is included as a part of this enrollment agreement, and I acknowledge that I have received a copy of this catalog." : .info])
        createLabels(with: ["2. Also, I have carefully read and received an exact copy of this enrollment agreement." : .info])
        createLabels(with: ["3. I understand that the School may terminate my enrollment if I fail to comply with attendance, academic and financial requirement or if I disrupt the normal activities of the School. While enrolled in the School, I understand that I must maintain Satisfactory Academic Progress as described in the School catalog and that my financial obligation to the School must be paid in full before a certificate may be awarded." : .info])
        createLabels(with: ["4. I also understand that this institution does not guarantee job placement to graduates upon program/course completion or upon graduation." : .info])
        createLabels(with: ["Contract Acceptance" : .subject])
        createLabels(with: ["I, the undersigned, have read and understand this agreement and acknowledge receipt of a copy. It is further understood and agreed that this agreement supersedes all prior or contemporaneous verbal or written agreements and may not be modified without the written agreement of the student and the School Official. I also understand that if I default upon this agreement I will be responsible for payment of any collection fees or attorney fees incurred by Georgia School of Dental Assisting, LLC." : .info])
        createLabels(with: ["My signature below signifies that I have read and understand all aspects of this agreement and do recognize my legal responsibilities in regard to this contract." : .info])
        //setConstraints()
        
    }
    
    @objc func handleBack() {
        self.dismiss(animated: true, completion: {})
    }
    
} // End of main class


class InfoLabel: UILabel {
    init(){
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        textColor = UIColor.black
        font = UIFont.systemFont(ofSize: 12)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SubjectLabel: UILabel {
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        textColor = UIColor.black
        font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class HeaderLabel: UILabel {
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        textColor = UIColor(r: 124, g: 128, b: 49)
        font = UIFont.boldSystemFont(ofSize: 20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

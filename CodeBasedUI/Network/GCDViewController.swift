//
//  GCDViewController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/31/24.
//

import UIKit
import SnapKit
import Alamofire

// serial(main) concurrent(global), sync async
// global qos(quality of service)
// dispatchGroup
// - notify: 동기 함수 - 잘 동작하기 위해서는 async로 맡겨놓은 작업이 동기적으로 동작해야 유효하다.
// => 네트워크 통신과 같은 비동기 함수가 group에 묶이게 되면, 비동기 함수는 또 다른 알바생이 담당하게 되기 때문에, 또 다른 알바생의 일을 기다리지 않고 notify를 바로 띄우게 된다.
// - enter / leave
class GCDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let group = DispatchGroup()
        
        // 4명의 알바생이 각자 일을 하고 있는 상황. 가가자 알아서 일이 끝날텐데, 누가 마지막에 끝날지 알 수 없음
        // 다른 알바생을 쓰지만, 시간이 줄어들지는 않는다... 결구 닭벼슬 혼자 일하는 상황이랑 같은 상황... 그럼에도 누가 마지막에 끝나는 지는 명확하게 알 수 있다.
        // => 4명의 알바생이 각자 일을 하면서, 즉 시간도 단축하고 마지막 여부도 알고 싶다!!
        // => DispatchQueue
        
        DispatchQueue.global().async(group: group) {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        
        DispatchQueue.global().async(group: group) {
            for i in 101...200 {
                print(i, terminator: " ")
            }
        }
        
        DispatchQueue.global().async(group: group) {
            for i in 201...300 {
                print(i, terminator: " ")
            }
        }
        
        DispatchQueue.global().async(group: group) {
            for i in 301...400 {
                print(i, terminator: " ")
            }
        }
        
        // 마지막 신호를 받게될때는 보통 메인 스레드로 가기 때문에 notify에서 .main으로 설정한다.
        group.notify(queue: .main) {
            print("4명 알바생 업무 끝났어요")
        }
    }
    
    
    func callBack() {
        DispatchQueue.global().async {
            for i in 1...100 {  // 네트워크 통신이라 가정
                print(i, terminator: " ")
            }
            print("1번 알바생 끝")
            
            DispatchQueue.global().async {
                for i in 101...200 {  // 네트워크 통신이라 가정
                    print(i, terminator: " ")
                }
                print("2번 알바생 끝")
                
                DispatchQueue.global().async {
                    for i in 201...300 {  // 네트워크 통신이라 가정
                        print(i, terminator: " ")
                    }
                    print("3번 알바생 끝")
                    
                    DispatchQueue.global().async {
                        for i in 301...400 {  // 네트워크 통신이라 가정
                            print(i, terminator: " ")
                        }
                        print("4번 알바생 끝")
                        
                    }
                }
            }
        }
    }
}

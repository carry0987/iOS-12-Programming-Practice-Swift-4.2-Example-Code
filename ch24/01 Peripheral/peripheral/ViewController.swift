//
//  ViewController.swift
//  Peripheral
//
//  Created by KoKang Chu on 2017/7/17.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import Cocoa
import CoreBluetooth

class ViewController: NSViewController, CBPeripheralManagerDelegate {

    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var textField: NSTextField!
    
    // 自訂一個錯誤型態
    enum SendDataError: Error {
        case CharacteristicNotFound
    }

    // GATT
    let A001_SERVICE = "A001"
    let C001_CHARACTERISTIC = "C001"
    
    var peripheralManager: CBPeripheralManager!
    // 記錄所有的 characteristic
    var charDictionary = [String: CBMutableCharacteristic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let queue = DispatchQueue.global()
        // 將觸發 1號method
        peripheralManager = CBPeripheralManager(delegate: self, queue: queue)
    }
    
    /* 1號method */
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        // 先判斷藍牙是否開啟，如果不是藍牙4.x ，也會傳回電源未開啟
        guard peripheral.state == .poweredOn else {
            // iOS 會出現對話框提醒使用者
            print(peripheral.state.rawValue)
            return
        }
        
        var service: CBMutableService
        var characteristic: CBMutableCharacteristic
        var charArray = [CBCharacteristic]()
        
        ////////////// 開始設定 service 與 characteristic ////////////
        service = CBMutableService(type: CBUUID(string: A001_SERVICE), primary: true)
        characteristic = CBMutableCharacteristic(
            type: CBUUID(string: C001_CHARACTERISTIC),
            properties: [.notifyEncryptionRequired, .write, .read],
            value: nil,
            permissions: [.writeEncryptionRequired, .readEncryptionRequired]
        )
        charDictionary[C001_CHARACTERISTIC] = characteristic
        
        // 如果有兩個以上的 characteristic, 用 append() 加到陣列中
        charArray.append(characteristic)
        
        // 在 service 中填入 characteristic 陣列
        service.characteristics = charArray
        // 註冊 service
        // 準備觸發 2號method
        peripheralManager.add(service)
    }
    
    /* 2號method */
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        guard error == nil else {
            print("ERROR:{\(#file, #function)}\n")
            print(error!.localizedDescription)
            return
        }
        
        // 為藍牙裝置取個名字
        let deviceName = "我的ABC裝置"
        // 開始廣播，讓 central 端可以找到這台裝置
        // 準備觸發 3號method
        peripheral.startAdvertising(
            [CBAdvertisementDataServiceUUIDsKey: [service.uuid],
             CBAdvertisementDataLocalNameKey: deviceName]
        )
    }
    
    /* 3號method */
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        // 周邊裝置開始廣播
        print("開始廣播")
    }

    /* 送資料到 central 端 */
    func sendData(_ data: Data, uuidString: String) throws {
        guard let characteristic = charDictionary[uuidString] else {
            // 沒有這個 uuid
            throw SendDataError.CharacteristicNotFound
        }
        
        peripheralManager.updateValue(
            data,
            for: characteristic,
            onSubscribedCentrals: nil
        )
    }
    
    /* Central 端訂閱 */
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        
        if peripheral.isAdvertising {
            peripheral.stopAdvertising()
            print("停止廣播")
        }
        
        if characteristic.uuid.uuidString == C001_CHARACTERISTIC {
            print("訂閱C001")
            do {
                let data = "Hello Central".data(using: .utf8)
                try sendData(data!, uuidString: C001_CHARACTERISTIC)
            } catch {
                print(error)
            }
        }
    }

    /* Central 端取消訂閱 */
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        if characteristic.uuid.uuidString == C001_CHARACTERISTIC {
            // Central 取消訂閱 C001
            print("取消訂閱C001")
        }
    }

    /* Central 端寫資料到 peripheral */
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        guard let at = requests.first else {
            return
        }
        
        guard let data = at.value else {
            return
        }
        
        if at.characteristic.uuid.uuidString == C001_CHARACTERISTIC {
            // 當 property 有 write 參數時，需執行下一行程式
            // 來向 central 端回傳「成功收到」訊息
            // 若參數為 writeWithoutResponse 時則不需要回傳訊息
            
            peripheral.respond(to: at, withResult: .success)
            
            // 收到的原始資料型態為 Data
            let string = "> " + String(data: data, encoding: .utf8)!
            print(string)

            DispatchQueue.main.async {
                if self.textView.string.isEmpty {
                    self.textView.string = string
                } else {
                    self.textView.string = self.textView.string + "\n" + string
                }
            }
        }
    }
    
    /* 收到 central 端要求讀取資料 */
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        request.value = nil
        
        if request.characteristic.uuid.uuidString == C001_CHARACTERISTIC {
            let data = "What do you want?".data(using: .utf8)
            request.value = data
        }
        
        // 要回傳的資料透過respond回傳
        peripheral.respond(to: request, withResult: .success)
    }

    /* 按下送出按鈕 */
    @IBAction func sendClick(_ sender: Any) {
        let string = textField.stringValue
        
        // 更新 Text View 的畫面
        if textView.string.isEmpty {
            textView.string = string
        } else {
            textView.string = textView.string + "\n" + string
        }
        
        // 將字串送到 central 端
        do {
            let data = string.data(using: .utf8)
            try sendData(data!, uuidString: C001_CHARACTERISTIC)
        } catch {
            print(error)
        }
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


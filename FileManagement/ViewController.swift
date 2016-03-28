//
//  ViewController.swift
//  FileManagement
//
//  Created by Nam (Nick) N. HUYNH on 3/28/16.
//  Copyright (c) 2016 Enclave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let fileManager = NSFileManager()
    
    func createFolderAtPath(path: String) {
        
        var error: NSError?
        fileManager.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil, error: &error)
        if error != nil {
            
            println("Failed to create directory: \(error)")
            
        } else {
            
            println("Created directory at \(path)")
            
        }
        
    }
    
    func createFilesInFolder(folder: String) {
        
        for counter in 1 ... 5 {
            
            let fileName = NSString(format: "%lu.txt", counter)
            let path = folder.stringByAppendingPathComponent(fileName)
            let fileContents = "Test"
            var error: NSError?
            fileContents.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: &error)
            if error != nil {
                
                println("Failed to save file with error: \(error)")
                
            } else {
                
                println("Successfully to save file at path: \(path)")
                
            }
            
        }
        
    }
    
    func enumerateFilesInFolder(folder: String) {
        
        var error: NSError?
        let contents = fileManager.contentsOfDirectoryAtPath(folder, error: &error)
        if error != nil {
            
            println("Error: \(error)")
            
        } else if contents?.count == 0 {
            
            println("No content was found")
            
        } else {
            
            println("Contents of path \(folder) = \(contents)")
            
        }
        
    }
    
    func deleteFilesInFolder(folder: String) {
        
        var error: NSError?
        let contents = fileManager.contentsOfDirectoryAtPath(folder, error: &error) as [String]
        if error != nil {
            
            println("Error: \(error)")
            
        } else {
            
            for fileName in contents {
                
                let filePath = folder.stringByAppendingPathComponent(fileName)
                if fileManager.removeItemAtPath(filePath, error: nil) {
                    
                    println("Successfully removed item at path \(filePath)")
                    
                } else {
                    
                    println("Failed to remove item at path \(filePath)")
                    
                }
                
            }
            
        }
        
    }
    
    func deleteFolderAtPath(path: String) {
        
        var error: NSError?
        if fileManager.removeItemAtPath(path, error: &error) {
            
            println("Successfully removed the path \(path)")
            
        } else {
            
            println("Error: \(error)")
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let txtFolder = NSTemporaryDirectory().stringByAppendingPathComponent("txt")
        createFolderAtPath(txtFolder)
        createFilesInFolder(txtFolder)
        enumerateFilesInFolder(txtFolder)
        deleteFilesInFolder(txtFolder)
        enumerateFilesInFolder(txtFolder)
        deleteFolderAtPath(txtFolder)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


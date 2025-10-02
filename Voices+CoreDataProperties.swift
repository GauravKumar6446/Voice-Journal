//
//  Voices+CoreDataProperties.swift
//  
//
//  Created by Gaurav Kumar on 02/10/25.
//
//

public import Foundation
public import CoreData


public typealias VoicesCoreDataPropertiesSet = NSSet

extension Voices {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Voices> {
        return NSFetchRequest<Voices>(entityName: "Voices")
    }

    @NSManaged public var title: String?
    @NSManaged public var journal: String?
    @NSManaged public var time: String?

}

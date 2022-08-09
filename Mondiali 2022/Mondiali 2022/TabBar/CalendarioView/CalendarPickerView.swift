//
//  CalendarPickerView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 07/08/22.
//

import SwiftUI

struct CalendarPickerView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var date: Date
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2022, month: 11, day: 21)
        let endComponents = DateComponents(year: 2022, month: 12, day: 18)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        DatePicker(
            "", selection: $date,
            in: dateRange,
            displayedComponents: .date
        ).environment(\.locale, Locale.init(identifier: "it")).labelsHidden().id(date)
    }
}

struct CalendarPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPickerView(date: .constant(Date()))
    }
}


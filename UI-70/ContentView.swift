//
//  ContentView.swift
//  UI-70
//
//  Created by にゃんにゃん丸 on 2020/12/10.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var date = Date()
    @State var data : Datetype!
    
    @State var expand = false
    @State var year = false
    
    @State var Size:CGFloat = 50
    var body: some View{
        
        VStack{
            
            if self.data != nil{
                
                ZStack{
                    VStack(spacing:15){
                        ZStack{
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                Text(data.Month)
                                    .font(.system(size: 15, weight: .bold))

                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                
                               
                                
                            }
                            .padding(.vertical)
                            
                            HStack{
                                
                                
                           
                                Button(action: {
                                    
                                    self.date = Calendar.current.date(byAdding: .month, value: -1, to: self.date)!
                                    self.updateDate()
                                    
                                }, label: {
                                    Image(systemName: "arrow.left")
                                        .font(.system(size: Size))
                                        
                                    
                                    
                                })
                                Spacer()
                               
                                
                                Button(action: {
                                    
                                    self.date = Calendar.current.date(byAdding: .month, value: 1, to: self.date)!
                                    self.updateDate()
                                    
                                }, label: {
                                    Image(systemName: "arrow.right")
                                        .font(.system(size: Size))
                                       
                                    
                                    
                                })
                                
                                
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal,30)
                        }
                        .background(Color.red)
                        
                             Text(data.Date)
                            .font(.system(size: 30, weight: .bold))
                        
                        
                             Text(data.Day)
                            .font(.system(size: 30, weight: .bold))
                        
                             Divider()
                        
                        
                        ZStack{
                            
                            Text(data.Year)
                           .font(.system(size: 30, weight: .bold))
                              
                            
                            HStack{
                                
                                
                                Spacer()
                                
                                Button(action: {withAnimation(.spring()){expand.toggle()}}, label: {
                                    
                                    Image(systemName: "arrow.right")
                                        .font(.system(size: Size))
                                        .foregroundColor(.gray)
                                        .rotationEffect(.init(degrees: expand ? 270 : 90))
                                    
                                })
                            }
                            
                        }
                        
                        if expand{
                            
                            Toggle("", isOn: $year)
                                .padding(.horizontal,15)
                                .padding(.trailing,15)
                            
                           
                            Text("Year")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.gray)
                                .offset(x: -80, y: -50)
                               
                                
                                
                                
                            
                            
                        }
                      
                        
                        
                        
                    }
                    .padding(.bottom,expand ? 15 : 12)
                    
                    HStack{
                        
                        
                   
                        Button(action: {
                            
                            self.date = Calendar.current.date(byAdding: year ? .year : .day, value: -1, to: self.date)!
                            self.updateDate()
                            
                        }, label: {
                            Image(systemName: "arrow.left")
                                .font(.system(size: Size))
                                
                                .foregroundColor(.black)
                            
                            
                        })
                        Spacer()
                       
                        
                        Button(action: {
                            self.date = Calendar.current.date(byAdding: year ? .year : .day, value: 1, to: self.date)!
                            self.updateDate()
                            
                        }, label: {
                            Image(systemName: "arrow.right")
                                .font(.system(size: Size))
                                
                                .foregroundColor(.black)
                            
                            
                        })
                        
                        
                    }
                    
                    
                    
                    
                }
                .frame(width: UIScreen.main.bounds.width / 1.5)
                .background(Color.green.opacity(0.3))
                .cornerRadius(10)
                
            }
            
        }
        
        .edgesIgnoringSafeArea(.all)
        
        .onTapGesture {
            let formatter = DateFormatter()
            
            formatter.dateFormat = "dd-MMM-YYYY"
            print(formatter.string(from: self.date))
        }
        
        .onAppear{
            
            self.updateDate()
        }
        
        
    }
    
    func updateDate(){
        
        let current = Calendar.current
        let date = current.component(.day, from: self.date)
        let MonthNo = current.component(.month, from: self.date)
        let month = current.monthSymbols[MonthNo - 1]
        let year = current.component(.year, from: self.date)
        let weekNo = current.component(.weekday, from: self.date)
        let day = current.weekdaySymbols[weekNo - 1]
        
        self.data = Datetype(Day: day, Date: "\(date)", Year: "\(year)", Month: month)
        
        
        
        
        
    }
    
}



struct Datetype {
    var Day : String
    var Date : String
    var Year : String
    var Month : String
}

//
//  __Chain.swift
//  __.swift
//
//  Copyright (c) 2014 Tatsuya Hirose
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

extension __.Chain {
    
    func first<T>() -> __.Chain<T>! {
        if let wrapped = self._wrapped as? [T] {
            return __.chain( __.first(wrapped) )
        }
        return nil
    }
    
    // alias for first
    func head<T>() -> __.Chain<T>! {
        return self.first()
    }
    
    // alias for first
    func take<T>() -> __.Chain<T>! {
        return self.first()
    }
    
    func first<T>(n: Int) -> __.Chain<[T]>! {
        if let wrapped = self._wrapped as? [T] {
            return __.chain( __.first(wrapped, n) )
        }
        return nil
    }
    
    // alias for first
    func head<T>(n: Int) -> __.Chain<[T]>! {
        return self.first(n)
    }
    
    // alias for first
    func take<T>(n: Int) -> __.Chain<[T]>! {
        return self.first(n)
    }
    
    func initial<T>(n: Int = 1) -> __.Chain<[T]>! {
        if let wrapped = self._wrapped as? [T] {
            return __.chain( __.initial(wrapped, n) )
        }
        return nil
    }

    func last<T>() -> __.Chain<T>! {
        if let wrapped = self._wrapped as? [T] {
            return __.chain( __.last(wrapped) )
        }
        return nil
    }
    
    func last<T>(n: Int) -> __.Chain<[T]>! {
        if let wrapped = self._wrapped as? [T] {
            return __.chain( __.last(wrapped, n) )
        }
        return nil
    }
    
    func rest<T>(n: Int = 1) -> __.Chain<[T]>! {
        if let wrapped = self._wrapped as? [T] {
            return __.chain( __.rest(wrapped, n) )
        }
        return nil
    }
    
    // alias for rest
    func tail<T>(n: Int = 1) -> __.Chain<[T]>! {
        return self.rest(n: n)
    }
    
    // alias for rest
    func drop<T>(n: Int = 1) -> __.Chain<[T]>! {
        return self.rest(n: n)
    }
    
    func compact<L : LogicValue>() -> __.Chain<[L]>! {
        if let wrapped = self._wrapped as? [L] {
            return __.chain( __.compact(wrapped) )
        }
        return nil
    }
    
    func flatten<T>() -> __.Chain<[T]>! {
        if let wrapped = self._wrapped as? [[T]] {
            return __.chain( __.flatten(wrapped) )
        }
        return nil
    }

    func without<E: Equatable>( values: E...) -> __.Chain<[E]>! {
        if let wrapped = self._wrapped as? [E] {
            return __.chain( __.without(wrapped, values: reinterpretCast(values)) )
        }
        return nil
    }
    
    func partition<T>( predicate: T -> Bool ) -> __.Chain<([T], [T])>! {
        if let wrapped = self._wrapped as? [T] {
            return __.chain( reinterpretCast(__.partition(wrapped, predicate: predicate)) )
        }
        return nil
    }
    
    // union and intersection functions are not implemented
    
    func difference<E: Equatable>(array: [E], others: [E]...) -> __.Chain<[E]>! {
        if let wrapped = self._wrapped as? [E] {
            return __.chain( __.difference(wrapped, others: reinterpretCast(others)) )
        }
        return nil
    }
    
    func uniq<E : Equatable>(isSorted: Bool = false) -> __.Chain<[E]>! {
        if let wrapped = self._wrapped as? [E] {
            return __.chain( __.uniq( wrapped, isSorted: isSorted) )
        }
        return nil
    }
    
    func uniq<T, E : Equatable>(isSorted: Bool, transform: T -> E) -> __.Chain<[T]>! {
        if let wrapped = self._wrapped as? [T] {
            return __.chain( __.uniq( wrapped, isSorted: isSorted, transform: transform) )
        }
        return nil
    }
    
    // zip and object functions are not implemented
    
    func indexOf<E: Equatable>(value:E) -> __.Chain<Int?>! {
        if let wrapped = self._wrapped as? [E] {
            return __.chain( __.indexOf(wrapped, value: value) )
        }
        return nil
    }
    
    func indexOf<C: Comparable>(value:C, isSorted: Bool) -> __.Chain<Int?>! {
        if let wrapped = self._wrapped as? [C] {
            return __.chain( __.indexOf(wrapped, value: value, isSorted: isSorted) )
        }
        return nil
    }
    
    func lastIndexOf<E : Equatable>(value: E) -> __.Chain<Int?>! {
        if let wrapped = self._wrapped as? [E] {
            return __.chain( __.lastIndexOf(wrapped, value: value) )
        }
        return nil
    }
    
    func lastIndexOf<E : Equatable>(value: E, from: Int) -> __.Chain<Int?>! {
        if let wrapped = self._wrapped as? [E] {
            return __.chain( __.lastIndexOf(wrapped, value: value, from: from) )
        }
        return nil
    }
    
    func sortedIndex<T, C : Comparable>(array : [T], value : T, transform: T -> C ) -> __.Chain<Int?>! {
        if let wrapped = self._wrapped as? [T] {
            return __.chain( __.sortedIndex(wrapped, value: value, transform: transform) )
        }
        return nil
    }
    
    // range function is not implemented

}